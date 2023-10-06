const express = require("express");
const router = express.Router();
const AuthController = require("../../controllers/users/AuthController");

router.post("/", AuthController.login);
router.post("/", AuthController.logout);

module.exports = router;
