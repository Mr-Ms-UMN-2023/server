const path = require("path");
const fs = require("fs");
const ejs = require("ejs");
var pdf = require("html-pdf");
const Audience = require("../../models/Audience");

const QRCode = require("qrcode");
const { sendEmail } = require("../../helpers/mailer");
const QRTokens = require("../../models/QRToken");

const sendTiket = async (req, res) => {
  try {
    const { order_id } = req.body;

    console.log("masuk 1", order_id);
    console.log(req.body);

    const transactionData = await Audience.query()
      .select(
        "transactions.id AS order_id",
        "himalaya_audiences.id AS user_id",
        "himalaya_audiences.nama AS nama",
        "himalaya_audiences.email AS email",
        "himalaya_audiences.whatsapp AS whatsapp",
        "transactions.quantity AS quantity",
        "himalaya_items.nama AS item_name"
      )
      .join(
        "transactions",
        "transactions.id",
        "=",
        "himalaya_audiences.transaction_id"
      )
      .join("himalaya_items", "himalaya_items.id", "=", "transactions.item_id")
      .where({ "transactions.id": order_id })
      .first();

    console.log("masuk");

    const audienceTokens = await QRTokens.query()
      .select("himalaya_qr_tokens.token AS tokens")
      .join(
        "himalaya_audiences",
        "himalaya_qr_tokens.audience_id",
        "=",
        "himalaya_audiences.id"
      )
      .where({ "himalaya_audiences.transaction_id": order_id });

    console.log("masuk 2", audienceTokens);
    let QRToken = [];
    audienceTokens.forEach((token) => {
      QRToken.push(token.tokens);
    });

    QRToken = audienceTokens;

    console.log("masuk 3", QRToken);

    const fullTicketHtmlDir = path.join(
      process.cwd(),
      "/src/views/pdf/ticket.ejs"
    );
    const fullTicketHtml = await fs.promises.readFile(
      fullTicketHtmlDir,
      "utf-8"
    );

    const attachments = [];
    let index = 0;
    const length = QRToken.length;
    let pdfVariables = {
      pages: [],
      vip: false,
      total: length,
    };

    console.log("masuk 4");

    for (let ticket of QRToken) {
      const qrCodeImage = await QRCode.toDataURL(ticket?.tokens);

      const pageVariables = {
        nama: transactionData.nama,
        email: transactionData.email,
        qr: qrCodeImage,
        ticket_token: ticket?.token,
        ticket_number: index++ + 1,
      };

      pdfVariables.pages.push(pageVariables);
    }

    const pdfHtmlDoc = ejs.render(fullTicketHtml, pdfVariables);
    const filename = `Tiket Himalaya - MR. & MS. UMN 2023.pdf`;
    const pathName = `storage/${filename}`;

    await attachments.push({ filename, path: pathName });

    await pdf
      .create(pdfHtmlDoc, {
        width: "1200px",
        height: "1650px",
      })
      .toStream(function (err, stream) {
        stream.pipe(fs.createWriteStream(pathName));
      });

    const { nama, email, whatsapp } = transactionData;
    const variables = {
      nama,
      email,
      wa: whatsapp,
      jumlah_ticket: length,
      transaction_id: transactionData.order_id,
    };

    const emailHtmlDir = path.join(process.cwd(), "/src/views/mail/ticket.ejs");
    const html = await fs.promises.readFile(emailHtmlDir, "utf-8");
    const renderHtml = ejs.render(html, variables);

    sendEmail(
      email,
      "[ Tiket Himalaya MR & MS UMN 2023 ]",
      renderHtml,
      attachments,
      (err, data) => {
        if (err) {
          console.log("Error sending email : ", err.message);
        }

        for (let file of attachments) {
          fs.unlink(file?.path, (err) => {
            if (err) {
              console.error(`Error deleting file: ${err}`);
            }
          });
        }
      }
    );

    return res.status(201).json({
      status: "SUCCESS",
      type: "PAYMENT_SETTLEMENT",
      code: 201,
      message: "Pembayaran berhasil dilakukan.",
    });
  } catch (err) {
    return res.status(500).json({
      status: "ERROR",
      type: "PAYMENT_SETTLEMENT",
      code: 500,
    });
  }
};

module.exports = {
  sendTiket,
};
