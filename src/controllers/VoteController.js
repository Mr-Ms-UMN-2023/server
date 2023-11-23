const knex = require("../database/knex");
const { v4: uuid } = require("uuid");
const { Model } = require("objection");
const randomToken = require("random-token");

const Vote = require("../models/Vote");
const Finalist = require("../models/Finalist");
const Product = require("../models/Product");
const validator = require("../helpers/data_validation");
const { createError } = require("../helpers/request_validation");
const ValidationException = require("../exceptions/ValidationException");
const { midtransCore, midtransSnap } = require("../config/midtrans");

const orderVote = async (req, res) => {
    const validationInfoList = [];

    try {

        const {
            quantity = 1,
            finalis_id = null,
            item_id = "Vote",
        } = req.body;

        if (!validator.isPositiveInteger(quantity)){
            validationInfoList.push(
                createError("jumlah", "Jumlah vote harus berupa angka bulat positif.")
              );
        }

        if (!finalis_id){
            validationInfoList.push(
                createError("finalis", "Finalis yang dipilih tidak boleh kosong.")
              );
        }

        if (validationInfoList.length > 0) {
            throw new ValidationException(400, "Input tidak valid", "INVALID_INPUT");
        }

        const transaction_id = "VOTE-" + new Date().getTime();

        const item = await Product.query().where({ id: item_id }).first();

        if (!item) {
          throw new ValidationException(
            404,
            "Produk tidak ditemukan",
            "PRODUCT_NOT_FOUND"
          );
        }

        const finalist = await Finalist.query().where({ id : finalis_id}).first();

        if (!finalist) {
            throw new ValidationException(
              404,
              "Finalis tidak ditemukan",
              "FINALIST_NOT_FOUND"
            );
          }

        // const userData = {
        //     id: uuid(),
        //     nama : "-",
        //     email : "",
        //     whatsapp,
        //   };

        const body = {
            transaction_details: {
              order_id: transaction_id,
              gross_amount: item.harga * quantity,
            },
            credit_card: {
              secure: true,
            },
            item_details: [
              {
                id: item.id,
                price: item.harga,
                name: item.nama,
                quantity,
              },
            ],
        };

        Model.transaction(async (trx) => {
            await Vote.query().insert({
                id : transaction_id,
                item_id : item.id,
                quantity,
                status : null,
                finalis_id,
                created_at : new Date() 
            });
        });

        const token = await midtransSnap.createTransactionToken(body);        

        return res.status(201).send({
            code: 201,
            message: "Berhasil menukar token snap.",
            data: { token },
          });        

    } catch (err) {
    if (err instanceof ValidationException) {
      return res.status(err.code).send({
        code: err.code,
        type: err.type,
        message: err.message,
        error: validationInfoList,
      });
    }
    console.error(err);
    return res.status(500).send({
      code: 500,
      message: "Internal Server Error : " + err.message,
    });
  }
}

// const votePaymentNotification = async (req, res) => {
// }

const getAllFinalistVoteCount = async (req, res) => {
    try {

        const data = await knex('finalis_2023')
        .select('finalis_2023.*')
        .select(knex.raw('COALESCE(SUM(vote_list_2023.quantity), 0) AS total_vote'))
        .leftJoin('vote_list_2023', function () {
          this.on('vote_list_2023.finalis_id', '=', 'finalis_2023.id')
            .andOn('vote_list_2023.status', '=', knex.raw('"settlement"'));
        })
        .groupBy('finalis_2023.id')

        return res.status(200).send({
            code: 200,
            message: "Berhasil mendapatkan data statistik vote.",
            data,
        });            
        
    } catch (err) {
    if (err instanceof ValidationException) {
      return res.status(err.code).send({
        code: err.code,
        type: err.type,
        message: err.message,
        error: validationInfoList,
      });
    }
    console.error(err);
    return res.status(500).send({
      code: 500,
      message: "Internal Server Error : " + err.message,
    });
  }
}

module.exports = {
    orderVote,
    getAllFinalistVoteCount, 
    // votePaymentNotification
    
}
