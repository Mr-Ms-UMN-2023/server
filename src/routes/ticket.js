const express = require('express');
const router = express.Router();
const TicketController = require("../controllers/TicketController");

router.post('/register', TicketController.orderTicket);
router.post('/payment/notification', TicketController.paymentNotification);

module.exports = router;