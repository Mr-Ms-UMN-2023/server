const knex = require("../../database/knex");

require("../../helpers/request_validation");
const ValidationException = require("../../exceptions/ValidationException");
require("../../config/midtrans");

const getAllFinalistVoteCount = async (req, res) => {
  try {
    const data = await knex("finalis_2023")
      .select("finalis_2023.*")
      .select(
        knex.raw("COALESCE(SUM(vote_list_2023.quantity), 0) AS total_vote")
      )
      .leftJoin("vote_list_2023", function () {
        this.on("vote_list_2023.finalis_id", "=", "finalis_2023.id").andOn(
          "vote_list_2023.status",
          "=",
          knex.raw('"settlement"')
        );
      })
      .groupBy("finalis_2023.id");

    const vote_list = await knex("vote_list_2023")
      .select("id", "finalis_id", "quantity")
      .where({ status: "settlement" });

    return res.status(200).send({
      code: 200,
      message: "Berhasil mendapatkan data statistik vote.",
      data,
      vote_list: vote_list,
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
};

module.exports = {
  getAllFinalistVoteCount,
  // votePaymentNotification
};
