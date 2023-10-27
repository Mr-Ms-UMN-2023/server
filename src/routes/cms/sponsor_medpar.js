const express = require("express");
const router = express.Router();
const SponsorMedparController = require("../../controllers/cms/SponsorMedparController");
const Middlewares = require("../../middlewares/user");

router.get("/get/sponsors", SponsorMedparController.getAllSponsor);
router.get(
  "/get/:id",
  //   Middlewares.auth,
  SponsorMedparController.sponsorDetail
);
router.get("/get/medpar", SponsorMedparController.getAllMedpar);
router.post("/put", SponsorMedparController.createData);
router.post("/edit", SponsorMedparController.editData);
module.exports = router;
