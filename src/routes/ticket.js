const express = require('express');
const router = express.Router();
const TicketController = require("../controllers/TicketController");
const Middlewares = require("../middlewares/user");

router.post('/register', TicketController.orderTicket);
router.post('/payment/notification', TicketController.paymentNotification);
router.get('/get/:token', TicketController.getTicketString);
router.get('/get/order_id/:order_id', TicketController.getTicketStringsByOrderID);
router.post('/vip/generate', Middlewares.auth, TicketController.generateVIPTicket);

module.exports = router;