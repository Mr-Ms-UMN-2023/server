const jwt = require("jsonwebtoken");
const User = require("../models/User");
const ValidationException = require("../exceptions/ValidationException");

const auth = async (req, res) => {
  try {
    const user = jwt.verify(
      req.headers.authorization.split(" ")[1],
      process.env.JWT_SECRET
    );

    // req.user = user;
    // const id = req.user.id;

    // const account = await User.query().where({ id }).first();
    if (!user) {
      throw new ValidationException(
        401,
        "Token tidak valid.",
        "UNAUTHENTICATED"
      );
    }

    next();
  } catch (err) {
    if (err instanceof ValidationException) {
      return res.status(err.code).send({
        code: err.code,
        type: err.type,
        message: err.message,
      });
    }

    return res.status(401).send({
      code: 401,
      type: "UNAUTHENTICATED",
      message: "Token tidak valid.",
    });
  }
};

module.exports = {
  auth,
};
