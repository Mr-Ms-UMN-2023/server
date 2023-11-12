require("dotenv/config");
const express = require("express");
const fileUpload = require("express-fileupload");
const cron = require("node-cron");
const cors = require("cors");
const app = express();

const invalidateTransaction = require("./src/cron/invalidate_transaction");

const PORT = process.env.PORT;
const APP_URL = process.env.APP_URL;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));
// app.use(express.static("storage"));
app.use(cors());
app.use(fileUpload());

// admin routes
app.use("/api/auth", require("./src/routes/users/auth.js"));

// public routes
app.use("/api/ticket", require("./src/routes/ticket.js"));
app.use("/api/vote", require("./src/routes/vote.js"));
app.use("/api/pdf", require("./src/routes/pdf.js"));
app.use("/api/sponsor_medpar", require("./src/routes/cms/sponsor_medpar"));
app.use("/api/transaction", require("./src/routes/cms/transaction.js"));
app.use("/api/admin/ticket", require("./src/routes/cms/tiket.js"));

cron.schedule("* * * * *", invalidateTransaction);

app.listen(PORT, () => {
  console.log(`Listening to the server on port : ${PORT}`);
});
