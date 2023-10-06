const express = require("express");
const router = express.Router();
const PdfController = require("../controllers/PdfController");

router.get("/", PdfController.print);

module.exports = router;
