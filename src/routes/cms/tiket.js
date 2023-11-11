const express = require("express");
const router = express.Router();
const TicketController = require("../../controllers/cms/TicketController");
const Middlewares = require("../../middlewares/user");

router.post("/resend", TicketController.sendTiket);

module.exports = router;
