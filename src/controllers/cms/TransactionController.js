const fs = require("fs");

const Transaction = require("../../models/Transaction");

const getTransaction = async (req, res) => {
  try {
    const data = await Transaction.query()
      .where({ status: "settlement" })
      .join(
        "himalaya_audiences",
        "transactions.id",
        "=",
        "himalaya_audiences.transaction_id"
      )
      .select("transactions.*", "himalaya_audiences.*");

    return res.status(201).json({
      status: "SUCCESS",
      type: "PAYMENT_DATA",
      code: 201,
      data: data,
    });
  } catch (err) {
    return res.status(500).send({
      code: 500,
      message: "Internal Server Error : " + err.message,
    });
  }
};

module.exports = { getTransaction };
