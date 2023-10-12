const fs = require("fs");
const path = require('path');
const htmlPDF = require("puppeteer-html-pdf");
const readFile = require("util").promisify(fs.readFile);
const products = require("../config/products");
const Transaction = require('../models/Transaction');
const Audience = require('../models/Audience');
const QRToken = require('../models/QRToken');
const QRCode = require("qrcode");
const pdf = require('html-pdf');
const ejs = require("ejs");


const downloadTicket = async (req, res) => {
  try {

    const { token = "" } = req.params; 
    // const file = await fs.promises.readFile(`storage/Tiket Himalaya - ${token.split('-')[1]}.pdf`, "utf8")
    const file = path.join(process.cwd(), `storage/Tiket Himalaya - ${token.split('-')[1]}.pdf`);
    fs.access(file, fs.constants.F_OK, async (err) => {
      if (err) {

          const findToken = await QRToken.query()
            .select('himalaya_qr_tokens.token AS token', 'himalaya_audiences.*')
            .join('himalaya_audiences', 'himalaya_audiences.id', '=', 'himalaya_qr_tokens.audience_id')
            .where({'himalaya_qr_tokens.token' : token})
            .first();
            
          
          if (!findToken){
              return res.status(404).send({
                code : 404, 
                message : "Token tidak valid."
              });
          }


          const qrCodeImage = await QRCode.toDataURL(findToken?.token);          
          const PDFVariables = {
            nama : findToken.nama, 
            qr : qrCodeImage,
          }          

          const PDFhtml = await fs.promises.readFile("src/views/pdf/ticket.ejs", "utf8");
          const PDFTemplate = ejs.render(PDFhtml, PDFVariables);           
          const filename = `Tiket Himalaya - ${findToken?.token.split('-')[1]}.pdf`;          
          const filePath = `storage/${filename}`;          
          
          pdf.create(PDFTemplate).toStream(function(err, stream){
            stream.pipe(fs.createWriteStream(pathName));
            res.sendFile(path.join(process.cwd(), filePath));            
          });                

      } 

      res.sendFile(file);

    });

  } catch (err) {
    console.error(err);
    return res.status(500).send({
      code : 500, 
      message : "Internal Server Error : " + err.message
    });
  }
};

module.exports = { downloadTicket };
