const Product = require("../../models/Product");

const getTicketItem = async (req, res) => {
  const data = await Product.query().select("*");
  res.status(200).json(data);
};

module.exports = { getTicketItem };
