const express = require("express");
const router = express.Router();
const TicketController = require("../controllers/TicketController");
const ScanQrController = require("../controllers/ScanQrController");
const Middlewares = require("../middlewares/user");
const { getTicketItem } = require("../controllers/ticket/TiketItemController");

router.get("/get/ticket-items", getTicketItem);
router.post("/register", TicketController.orderTicket);
router.post("/payment/notification", TicketController.paymentNotification);
router.get("/get/:token", TicketController.getTicketString);
router.get(
  "/get/order_id/:order_id",
  TicketController.getTicketStringsByOrderID
);
router.post(
  "/vip/generate",
  Middlewares.auth,
  TicketController.generateVIPTicket
);


// scan qr

router.get(
  "/data/:token",
  Middlewares.auth, 
  ScanQrController.getTicketData
)
router.post(
  "/attendance",
  Middlewares.auth, 
  ScanQrController.attendanceHandler
);

module.exports = router;
