const express = require("express");
const router = express.Router();
const TicketController = require("../controllers/TicketController");
const VoteController = require("../controllers/VoteController");

router.post("/order", VoteController.orderVote);
router.get("/statistic", VoteController.getAllFinalistVoteCount);

module.exports = router;