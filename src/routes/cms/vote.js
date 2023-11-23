const express = require("express");
const router = express.Router();

const VoteController = require("../../controllers/cms/VoteController");

router.get("/statistic", VoteController.getAllFinalistVoteCount);

module.exports = router;
