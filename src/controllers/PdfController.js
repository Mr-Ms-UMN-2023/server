const fs = require("fs");
const htmlPDF = require("puppeteer-html-pdf");
const readFile = require("util").promisify(fs.readFile);
const products = require("../config/products");
const ejs = require("ejs");

const print = async (req, res) => {
  const pdfData = {
    tiketData: {
      nama: "Koong Hiap",
    },

    baseUrl: `${req.protocol}://${req.hostname}`,
  };

  const options = {
    path: `storage/${products?.ticket.name}-${products?.ticket.id}.pdf`,
  };

  try {
    const html = await fs.readFileSync("src/views/pdf/ticket.ejs", "utf8");
    const template = ejs.render(html, pdfData);

    const buffer = await htmlPDF.create(template, options);
    res.attachment(`${products?.ticket.name}-${products?.ticket.id}.pdf`);
    res.end(buffer);
  } catch (err) {
    console.log(err);
    res.send("Gagal bikin pdf");
  }
};

module.exports = { print };
