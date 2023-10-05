const express = require('express');
const { v4: uuid } = require('uuid');
const { Model } = require("objection");
const randomToken = require("random-token");
const Audience = require('../models/Audience');
const Transaction = require('../models/Transaction');
const router = express.Router();
const User = require('../models/User');
const { createError } = require('../helpers/request_validation');
const products = require('../config/products');
const validator = require('../helpers/data_validation');
const ValidationException = require('../exceptions/ValidationException');
const { midtransCore, midtransSnap } = require("../config/midtrans");




const orderTicket = async (req, res) => {
    const validationInfoList = [];    
    try {
        const { nama = "", email, whatsapp } = req.body;

        if (!validator.isValidName(nama)) validationInfoList.push(createError("nama", "Nama tidak boleh kosong."));
        if (!validator.isValidEmail(email)) validationInfoList.push(createError("email", "Format email tidak valid."));
        if (!validator.isValidPhoneNumber(whatsapp)) validationInfoList.push(createError("whatsapp", "Nomor telepon tidak valid."));
  
        if (validationInfoList.length > 0){
          throw new ValidationException(400, "Input tidak valid", "INVALID_INPUT");
        }
  
        const transaction_id = randomToken(32);
  
        const userData = {
            id : uuid(),
            nama, email, whatsapp
        }
  
        // ini nanti custom lagi sesuai row seat nya
        // ada VIP, jadi mungkin ada conditional buat VIP
        //    - (prefix) guest biasa = "MRMS2023-"
        //    - (prefix) VIP = "VIP-MRMS2023-"      
  
        // DETAIL TIKET MASIH TESTING
        const body = {
            transaction_details: {
              order_id: "MRMS2023-" + transaction_id,
              gross_amount: products.ticket?.price, 
            },
            credit_card: {
              secure: true,
            },
            item_details: [
              {...products.ticket, quantity : 1}
            ],
            customer_details: userData
          };    
  
  
          Model.transaction(async (trx) => {
  
            await Transaction.query().insert({
              id : body.transaction_details.order_id,
              status : null,
            });
  
            await Audience.query().insert({
              ...userData, 
              transaction_id : body.transaction_details.order_id,
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
    
        const transactionData = await Transaction.query()
          .where({
            id: order_id,
            status : "settlement"
          })
          .first();
    
        if (transactionData) {
            return res.status(208).json({
              status: "SUCCESS",
              type: "PAID",
              code: 208,
              message: "Pembayaran telah dilakukan.",
            });
        }    
        
         
        if (transaction_status == "settlement") {
            const token = "MRMS23-" + randomToken(32);
            Model.transaction(async (trx) => {
                await Transaction.query()
                    .where({
                        id: order_id,
                    })
                    .update({
                        status: "settlement",
                    });       
                    
                await Audience.query()
                    .where({
                        transaction_id: order_id,
                    })
                    .update({token}); 
            }).catch((err) => {
                console.error(err);
                return res.status(500).send({
                  code : 500, 
                  message : "Internal Server Error : " + err.message
                });
              });                 
         
            return res.status(200).json({
                status: "SUCCESS",
                type: "PAYMENT_SETTLEMENT",
                code: 200,
                message: "Pembayaran berhasil dilakukan.",
            });          

        // send email di akhir
        } if (transaction_status == "pending") {
            await Transaction.query()
                .where({
                    id: order_id,
                })
                .update({
                    status: "pending",
                });

            return res.status(200).json({
                status: "SUCCESS",
                type: "PAYMENT_PENDING",
                code: 200,
                message:
                    "Pembayaran sedang dalam status pending / menunggu aksi dari user.",
            });
        }

        await Transaction.query()
            .where({
                id: order_id,
            })
            .update({
                status: transaction_status,
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


module.exports = {
    orderTicket,
    paymentNotification
}
