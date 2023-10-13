const express = require('express');
const path = require('path');
const fs = require('fs');
const ejs = require('ejs');
const puppeteer = require('puppeteer');
var pdf = require('html-pdf');
const { v4: uuid } = require('uuid');
const { Model } = require("objection");
const randomToken = require("random-token");
const Audience = require('../models/Audience');
const Transaction = require('../models/Transaction');
const nodeMailer = require('../config/mail');
const html_to_pdf = require('html-pdf-node');
const router = express.Router();
const User = require('../models/User');
const QRToken = require('../models/QRToken');
const Product = require('../models/Product');
const nodeHtmlToImage = require('node-html-to-image')
const knex = require('../database/knex');
const { createError } = require('../helpers/request_validation');
const htmlPDF = require("puppeteer-html-pdf");
const QRCode = require("qrcode");
const readFile = require("util").promisify(fs.readFile);
const { sendEmail } = require('../helpers/mailer');
const validator = require('../helpers/data_validation');
const ValidationException = require('../exceptions/ValidationException');
const { midtransCore, midtransSnap } = require("../config/midtrans");


const orderTicket = async (req, res) => {
    const validationInfoList = [];    
    try {
        const { nama = "", email, whatsapp, jumlah = 0, item_id = "(TESTING)_TICKET_HIMALAYA" } = req.body;

        if (!validator.isValidName(nama)) validationInfoList.push(createError("nama", "Nama tidak boleh kosong."));
        if (!validator.isValidEmail(email)) validationInfoList.push(createError("email", "Format email tidak valid."));
        if (!validator.isValidPhoneNumber(whatsapp)) validationInfoList.push(createError("whatsapp", "Nomor telepon tidak valid."));
        if (!validator.isPositiveInteger(jumlah)) validationInfoList.push(createError("jumlah", "Jumlah tiket harus berupa angka bulat."));
      
        if (validationInfoList.length > 0){
          throw new ValidationException(400, "Input tidak valid", "INVALID_INPUT");
        }
  
        const transaction_id =  "MRMS2023-" + new Date().getTime();

        const userData = {
            id : uuid(),
            nama, email, whatsapp
        }

        const item = await Product.query()
          .where({id : item_id})
          .first();

        if (!item){
            throw new ValidationException(404, "Produk tidak ditemukan", "PRODUCT_NOT_FOUND");         
        }


        if (parseInt(item.reserved, 10) + parseInt(jumlah, 10) > item.quota){
          throw new ValidationException(403, "Kuota tiket sudah habis.", "PRODUCT_UNAVAILABLE");              
        }
  
        // ini nanti custom lagi sesuai row seat nya
        // ada VIP, jadi mungkin ada conditional buat VIP
        //    - (prefix) guest biasa = "MRMS2023-"
        //    - (prefix) VIP = "VIP-MRMS2023-"      
  
        // DETAIL TIKET MASIH TESTING
        const body = {
          transaction_details: {
            order_id:  transaction_id,
            gross_amount: item.harga * jumlah, 
          },
          credit_card: {
            secure: true,
          },
          item_details: [
            {
              id: item.id,
              price: item.harga,
              name: item.nama,
              quantity : jumlah                
            }
          ],
          customer_details: userData
        };   
  
  
          Model.transaction(async (trx) => {

            await Product.query()
              .where({id : item.id})
              .update({reserved : parseInt(item.reserved, 10) + parseInt(jumlah, 10)})
  
            await Transaction.query().insert({
              id : body.transaction_details.order_id,
              item_id : item.id, 
              quantity : jumlah,
              status : null,
              payment_init_time : new Date(),
            });
  
            await Audience.query().insert({
              ...userData, 
              transaction_id : body.transaction_details.order_id,
              created_at : new Date(),
              updated_at : new Date(),
            });
  
          }).catch((err) => {
            console.error(err);
            return res.status(500).send({
              code : 500, 
              message : "Internal Server Error : " + err.message
            });
          });        
  
          const token = await midtransSnap.createTransactionToken(body);      

          return res.status(201).send({
            code : 201, 
            message : "Berhasil menukar token snap.",
            data : {token}
          })
      } catch (err) {

        if (err instanceof ValidationException){
            return res.status(err.code).send({
                code : err.code, 
                type : err.type,
                message : err.message, 
                error : validationInfoList
              });            
        }   
        console.error(err);
        return res.status(500).send({
          code : 500, 
          message : "Internal Server Error : " + err.message
        });
      }
}


const paymentNotification = async (req, res) => {

    try {

        const payload = req.body;
        const { transaction_status, order_id } = payload;

        
        const transactionData = await Audience.query()
          .select(
              'transactions.id AS order_id', 
              'himalaya_audiences.id AS user_id', 
              'transactions.status AS status', 
              'himalaya_audiences.nama AS nama',
              'himalaya_audiences.email AS email',
              'transactions.quantity AS quantity',
              'himalaya_items.nama AS item_name')
          .join('transactions', 'transactions.id', '=', 'himalaya_audiences.transaction_id')
          .join('himalaya_items', 'himalaya_items.id', '=', 'transactions.item_id')
          .where({'transactions.id' : order_id})
          .first();


    
        if (transactionData && transactionData?.status == 'settlement') {
            return res.status(208).json({
              status: "SUCCESS",
              type: "PAID",
              code: 208,
              message: "Pembayaran telah dilakukan.",
            });
        }    
        
         
        if (transaction_status == "settlement") {


            const QRTokens = [];
            for (let count = 0; count < transactionData.quantity; count++){
              const token = "MRMS23-" + randomToken(32);
              QRTokens.push({token, audience_id : transactionData.user_id});
            }

  
            Model.transaction(async (trx) => {
                await Transaction.query()
                    .where({
                        id: order_id,
                    })
                    .update({
                        status: "settlement",
                        payment_done_time : new Date()
                    });       
                    
                // await QRToken.query()
                //     .insert(QRTokens);
                await knex('himalaya_qr_tokens').insert(QRTokens); 

            }).catch((err) => {
                console.error(err);
                return res.status(500).send({
                  code : 500, 
                  message : "Internal Server Error : " + err.message
                });
              });
              
            
            
            const headerHtmlDir = path.join(process.cwd(), "/src/views/pdf/ticket_header.ejs");                
            const headerHtml = await fs.promises.readFile(headerHtmlDir, 'utf-8');

            const pageHtmlDir = path.join(process.cwd(), "/src/views/pdf/ticket_page.ejs");    
            const pageHtml = await fs.promises.readFile(pageHtmlDir, 'utf-8');

            const footerHtmlDir = path.join(process.cwd(), "/src/views/pdf/ticket_footer.ejs");                
            const footerHtml = await fs.promises.readFile(footerHtmlDir, 'utf-8');            

            let fullHtml = ejs.render(headerHtml);

            const attachments = [];
            for (let ticket of QRTokens) {
              const qrCodeImage = await QRCode.toDataURL(ticket?.token);

              const pageVariables = {
                nama: transactionData.nama,
                qr: qrCodeImage,
              };

              const pageHtml = ejs.render(pageHtml, pageVariables);
              fullHtml += pageHtml;

  
            }

            fullHtml += footerHtml;

            const filename = `Tiket Himalaya - MR. & MS. UMN 2023.pdf`;
            const pathName = `storage/${filename}`;            

            attachments.push({filename, path : pathName});

            pdf.create(fullHtml).toStream(function(err, stream){
              stream.pipe(fs.createWriteStream(pathName));
            });


            // email
            const { nama, email } = transactionData;
            const variables = { nama }

            const emailHtmlDir = path.join(process.cwd(), "/src/views/mail/ticket.ejs");                 
            const html = await fs.promises.readFile(emailHtmlDir, 'utf-8');
            const renderHtml = ejs.render(html, variables);

            sendEmail(email, "[ Tiket Himalaya MR & MS UMN 2023 ]", renderHtml, attachments, (err, data) => {

              if (err) {
                console.log("Error sending email : ", err.message);
              }

              for (let file of attachments){
                fs.unlink(file?.path, (err) => {
                  if (err) {
                    console.error(`Error deleting file: ${err}`);
                  } 
                });
              }



            });

            return res.status(201).json({
              status: "SUCCESS",
              type: "PAYMENT_SETTLEMENT",
              code: 201,
              message: "Pembayaran berhasil dilakukan.",
            });

                     
        
        } if (transaction_status == "pending") {
          
            console.log(payload);
            Model.transaction(async (trx) => {

              await Transaction.query()
                  .where({
                      id: order_id,
                  })
                  .update({
                      status: "pending",
                  });

            }).catch((err) => {
              console.error(err);
              return res.status(500).send({
                code : 500, 
                message : "Internal Server Error : " + err.message
              });
            });


            return res.status(200).json({
                status: "SUCCESS",
                type: "PAYMENT_PENDING",
                code: 200,
                message:
                    "Pembayaran sedang dalam status pending / menunggu aksi dari user.",
            });
        }

        Model.transaction(async (trx) => {

          await Transaction.query()
          .where({
              id: order_id,
          })
          .update({
              status: transaction_status,
          });  

        }).catch((err) => {
          console.error(err);
          return res.status(500).send({
            code : 500, 
            message : "Internal Server Error : " + err.message
          });
        });


    

        return res.status(200).json({
            status: "SUCCESS",
            type: "PAYMENT_" + transaction_status.toUpperCase(),
            code: 200,
            message:
                "Berhasil melakukan pemrosesan pada payment dengan status " +
                transaction_status,
            });      

      
    
      } catch (err) {

        if (err instanceof ValidationException){
            return res.status(err.code).send({
                code : err.code, 
                type : err.type,
                message : err.message, 
              });            
        }        

        console.error(err);
        return res.status(500).send({
          code : 500, 
          message : "Internal Server Error : " + err.message
        });    
      }
}


const getTicketString = async (req, res) => {

    try {
        const { token = "" } = req.params; 

        const data = await QRToken.query()
          .where({token})
          .first();

        if (!data){
          throw new ValidationException(404, "Token tidak ditemukan.", "INVALID_TOKEN");
        }

        return res.status(200).json({
          code: 200,          
          type: "SUCCESS",
          message: "Berhasil mendapatkan token QR.",
          data : {token : data.token}
      });          

    } catch (err) {

      if (err instanceof ValidationException){
          return res.status(err.code).send({
              code : err.code, 
              type : err.type,
              message : err.message, 
            });            
      }

      console.error(err);
      return res.status(500).send({
        code : 500, 
        message : "Internal Server Error : " + err.message
      });
    }
}


module.exports = {
    orderTicket,
    paymentNotification,
    getTicketString
}
