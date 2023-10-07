const { v4: uuid } = require('uuid');
const { Model } = require("objection");
const bcrypt = require("bcrypt");
const randomToken = require("random-token");
const Audience = require('../models/Audience');
const Transaction = require('../models/Transaction');
const jwt = require("jsonwebtoken");
const User = require('../models/User');
const { createError } = require('../helpers/request_validation');
const products = require('../config/products');
const validator = require('../helpers/data_validation');
const ValidationException = require('../exceptions/ValidationException');

const login = async (req, res) => {
    const validationInfoList = [];    
    try {

        const { email = "", password = "" } = req.body;
        
        const user = await Audience.query()
            .where({email})
            .first();

        if (!user){
            throw new ValidationException(401, "Email dan/atau kata sandi salah.", "UNAUTHENTICATED");
        }


        if (!(await bcrypt.compare(password, user.password))) {
            throw new ValidationException(401, "Email dan/atau kata sandi salah.", "UNAUTHENTICATED");
        }   
        
        const token = jwt.sign({
            id : user.id,
            username : user.username, 
            email : user.email,
        }, process.env.JWT_SECRET, {
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
                error : validationInfoList
              });            
        }

        console.error(err);
        return res.status(500).send({
          code : 500, 
          message : "Internal Server Error : " + err.message
        });
      }
}


module.exports = {
    login,
}