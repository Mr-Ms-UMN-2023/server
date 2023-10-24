const express = require("express");
const router = express.Router();
const SponsorMedparController = require("../../controllers/cms/SponsorMedparController");

router.get("/get/sponsors", SponsorMedparController.getAllSponsor);
router.get("/get/medpar", SponsorMedparController.getAllMedpar);

module.exports = router;
