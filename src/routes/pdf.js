const express = require("express");
const router = express.Router();
const PdfController = require("../controllers/PdfController");

router.get("/ticket/download/:token", PdfController.downloadTicket);

module.exports = router;
