const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getTransactions = async (req, res) => {
  try {
    const txns = await prisma.transaction.findMany();
    res.json(txns);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createTransaction = async (req, res) => {
  try {
    const txn = await prisma.transaction.create({ data: req.body });
    res.status(201).json(txn);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
