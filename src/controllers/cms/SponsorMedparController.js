const fs = require("fs");

const SponsorMedpar = require("../../models/SponsorMedpar");

const getAllSponsor = async (req, res) => {
  try {
    const data = await SponsorMedpar.query().where({ type: 1 });

    return res.status(201).json({
      status: "SUCCESS",
      type: "SPNSOR_DATA",
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

const getAllMedpar = async () => {
  try {
    const data = await SponsorMedpar.query().where({ type: 1 });

    return res.status(201).json({
      status: "SUCCESS",
      type: "MEDPAR_DATA",
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

module.exports = { getAllMedpar, getAllSponsor };
