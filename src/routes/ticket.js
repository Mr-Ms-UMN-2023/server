const express = require('express');
const router = express.Router();
const TicketController = require("../controllers/TicketController");

router.post('/register', TicketController.orderTicket);
router.post('/payment/notification', TicketController.paymentNotification);
router.get('/get/:token', TicketController.getTicketString);
router.get('/get/order_id/:order_id', TicketController.getTicketStringsByOrderID);

module.exports = router;