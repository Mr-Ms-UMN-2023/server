const express = require("express");
const router = express.Router();
const TransactionController = require("../../controllers/cms/TransactionController");
const Middlewares = require('../../middlewares/user');

router.get("/get/transaction", Middlewares.auth, TransactionController.getTransaction);

module.exports = router;
