const { v4: uuid } = require('uuid');
const { Model } = require("objection");
const bcrypt = require("bcryptjs");
const randomToken = require("random-token");
const User = require('../../models/User');
const jwt = require("jsonwebtoken");
const { createError } = require('../../helpers/request_validation');
const validator = require('../../helpers/data_validation');
const ValidationException = require('../../exceptions/ValidationException');

const login = async (req, res) => {
    try {

        const { email = "", password = "" } = req.body;
        
        const user = await User.query()
            .where({email})
            .first();

        if (!user){
            throw new ValidationException(401, "Email dan/atau kata sandi salah.", "UNAUTHENTICATED");
        }


        if (!(await bcrypt.compare(password, user.password))) {
            throw new ValidationException(401, "Email dan/atau kata sandi salah.", "UNAUTHENTICATED");
        }   
        
        const token = jwt.sign({id : user.id}, process.env.JWT_SECRET, {
            expiresIn: 86400,
          }); 

          return res.status(200).send({
            code: 200,
            message: "Login berhasil.",
            data: {
              token,
            },
          });        

      } catch (err) {

        if (err instanceof ValidationException){
            return res.status(err.code).send({
                code : err.code, 
                type : err.type,
                message : err.message, 
              });            
        }

        console.error(err);
        return res.status(500).send({
          code : 500, 
          message : "Internal Server Error : " + err.message
        });
      }
}


const verifyToken = async (req, res) => {
  try {
    const token = jwt.verify(
      req.headers.authorization.split(" ")[1],
      process.env.JWT_SECRET
    );

    const user = token.id;

    return res.status(200).send({
      code : 200, 
      message : "Authenticated."
    });
  

  } catch (err){
    return res.status(401).send({
      code: 401,
      message: "Unauthenticated.",
    });
  }

}


module.exports = {
    login,
    verifyToken
}