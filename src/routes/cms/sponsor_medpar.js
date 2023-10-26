const express = require("express");
const router = express.Router();
const SponsorMedparController = require("../../controllers/cms/SponsorMedparController");
const Middlewares = require("../../middlewares/user")

router.get("/get/sponsors", Middlewares.auth ,SponsorMedparController.getAllSponsor);
router.get("/get/medpar", Middlewares.auth, SponsorMedparController.getAllMedpar);

module.exports = router;
