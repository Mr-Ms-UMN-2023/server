const express = require("express");
const router = express.Router();
const TransactionController = require("../../controllers/cms/TransactionController");

router.get("/get/transaction", TransactionController.getTransaction);

module.exports = router;
