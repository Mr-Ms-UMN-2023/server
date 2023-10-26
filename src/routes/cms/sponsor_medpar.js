const express = require("express");
const router = express.Router();
const SponsorMedparController = require("../../controllers/cms/SponsorMedparController");
const Middlewares = require("../../middlewares/user");

router.get("/get/sponsors", SponsorMedparController.getAllSponsor);
router.get("/get/medpar", SponsorMedparController.getAllMedpar);

module.exports = router;
