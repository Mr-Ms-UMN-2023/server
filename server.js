require("dotenv/config");
const express = require("express");
const fileUpload = require("express-fileupload");
const cors = require("cors");
const app = express();

const PORT = process.env.PORT;
const APP_URL = process.env.APP_URL;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use(cors());
app.use(fileUpload());

app.use("/api/ticket", require("./src/routes/ticket.js"));
app.use("/api/pdf", require("./src/routes/pdf.js"));

app.listen(PORT, () => {
  console.log(`Listening to the server on port : ${PORT}`);
});
