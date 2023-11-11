const { Model } = require("objection");
const knex = require("../database/knex");
const Audience = require("../models/Audience");
const Product = require("../models/Product");
const Transaction = require("../models/Transaction");

const invalidateTransaction = async (req, res) => {
  try {
    const time = new Date();
    time.setMinutes(time.getMinutes() - 15);

    Model.transaction(async (trx) => {
      const invalidTransactions = await Transaction.query()
        .where(function (query) {
          query.where("status", "<>", "settlement").orWhereNull("status");
        })
        .andWhereRaw("payment_init_time < ?", [time]);
      console.log(invalidTransactions);

      const totalQuantity = await Transaction.query()
        .select(
          knex.raw("SUM(transactions.quantity) as total"),
          "status as status",
          "item_id as id"
        )
        .where((query) => {
          query.where("status", "<>", "settlement").orWhereNull("status");
        })
        .andWhereRaw("payment_init_time < ?", [time])
        .first();

      console.log("cron job", totalQuantity);

      let reserved = totalQuantity?.total || 0;

      await Transaction.query()
        .where(function (query) {
          query.where("status", "<>", "settlement").orWhereNull("status");
        })
        .andWhereRaw("payment_init_time < ?", [time])
        .delete();

      let item_id = totalQuantity?.id;

      console.log("total quantity", totalQuantity);

      if (item_id.includes("Couple")) {
        item_id = totalQuantity?.status;

        await Product.query()
          .where({ id: "Couple" })
          .patch({
            reserved: knex.raw(`reserved - ${reserved}`),
          });
      }

      await Product.query()
        .where({ id: item_id })
        .patch({
          reserved: knex.raw(`reserved - ${reserved}`),
        });
    }).catch((err) => {
      console.error("Cron job error : ", err);
    });
  } catch (err) {
    console.error("Cron job error : ", err);
  }
};

module.exports = invalidateTransaction;
