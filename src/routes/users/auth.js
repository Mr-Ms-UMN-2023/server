const express = require("express");
const router = express.Router();
const AuthController = require("../../controllers/users/AuthController");

router.post("/login", AuthController.login);

module.exports = router;
