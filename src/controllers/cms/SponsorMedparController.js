const fs = require("fs");

const SponsorMedpar = require("../../models/SponsorMedpar");
const randomToken = require("random-token");

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

const getAllMedpar = async (req, res) => {
  try {
    const data = await SponsorMedpar.query().where({ type: 2 });

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

const sponsorDetail = async (req, res) => {
  try {
    const { id } = req.params;
    const data = await SponsorMedpar.query()
      .where({ Sponsor_MedparID: id })
      .first();
    console.log("hello", id);
    return res.status(201).json({
      status: "SUCCESS",
      type: "DETAIL",
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

const createData = async (req, res) => {
  try {
    const { type = "", img = "", nama = "", url = "", bg = false } = req.body;

    const data = await SponsorMedpar.query().insert({
      Sponsor_MedparID: randomToken(32),
      type: Number(type),
      src: img,
      nama: nama,
      url: url,
      bg: bg,
    });

    return res.status(201).json({
      status: "SUCCESS",
      type: "DETAIL",
      code: 201,
    });
  } catch (err) {
    return res.status(500).send({
      code: 500,
      message: "Internal Server Error : " + err.message,
    });
  }
};

const editData = async (req, res) => {
  try {
    const {
      id = "",
      type = "",
      img = "",
      nama = "",
      url = "",
      bg = false,
    } = req.body;

    console.log(req.body);

    const data = await SponsorMedpar.query()
      .where({ Sponsor_MedparID: id })
      .update({
        type: type,
        src: img,
        nama: nama,
        url: url,
        bg: bg,
      });
    return res.status(201).json({
      status: "SUCCESS",
      type: "DETAIL",
      code: 201,
    });
  } catch (err) {
    return res.status(500).send({
      code: 500,
      message: "Internal Server Error : " + err.message,
    });
  }
};

module.exports = {
  getAllMedpar,
  getAllSponsor,
  sponsorDetail,
  createData,
  editData,
};
