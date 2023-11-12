const express = require("express");
const router = express.Router();
const TicketController = require("../controllers/TicketController");
const VoteController = require("../controllers/VoteController");

router.post("/order", VoteController.orderVote);

module.exports = router;