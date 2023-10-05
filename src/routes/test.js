const express = require('express');
const { v4: uuid } = require('uuid');
const { Model } = require("objection");
const randomToken = require("random-token");
const Audience = require('../models/Audience');
const Transaction = require('../models/Transaction');
const router = express.Router();
const User = require('../models/User');
const { midtransCore, midtransSnap } = require("../config/midtrans");

router.get('/exchange-snap-token', async (req, res) => {
    // const users = await User.query();
    // return res.json({users});

    try {

      const transaction_id = randomToken(32);

      const userData = {
          id : uuid(),
          nama : "(TESTING) Mahesa", 
          email : "farrel.dinarta@student.umn.ac.id", 
          whatsapp : "081383533535"
      }

      const body = {
          transaction_details: {
            // order_id: transaction_id,
            order_id: "MRMS2023-" + transaction_id,
            gross_amount: 101, // harga tiket malpun
          },
          credit_card: {
            secure: true,
          },
          item_details: [
            {
              id: "(TESTING) TICKET HIMALAYA",
              price: 101,
              quantity: 1,
              name: "(TESTING) Tiket HIMALAYA MR. & MS. UMN 2023",
            },
          ],
          // TESTER
          customer_details: userData
        };    


        Model.transaction(async (trx) => {

          await Transaction.query().insert({
            id : transaction_id,
            status : null,
          });

          await Audience.query().insert({
            ...userData, 
            transaction_id,
          });

        }).catch((err) => {
          throw new Error(err.message);
        });        


  
        const token = await midtransSnap.createTransactionToken(body);      
  
  
        return res.status(201).send({
          code : 201, 
          message : "Berhasil menukar token snap.",
          data : {token}
        })
    } catch (err) {
      console.error(err);
      return res.status(500).send({
        code : 500, 
        message : "Internal Server Error : " + err.message
      });
    }



});


router.post('/payment-notification-callback', async (req, res) => {
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

    Model.transaction(async (trx) => {

      if (transaction_status == "settlement") {
        const token = "MRMS23-" + randomToken(32);

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


      return res.status(200).json({
        status: "SUCCESS",
        type: "PAYMENT_" + transaction_status.toUpperCase(),
        code: 200,
        message:
          "Berhasil melakukan pemrosesan pada payment dengan status " +
          transaction_status,
      });      

    }).catch((err) => {
      throw new Error(err.message);
    });        

  } catch (err) {
    console.error(err);
    return res.status(500).send({
      code : 500, 
      message : "Internal Server Error : " + err.message
    });    
  }
});


module.exports = router;