const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getDues = async (req, res) => {
  try {
    const dues = await prisma.due.findMany();
    res.json(dues);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createDue = async (req, res) => {
  try {
    const due = await prisma.due.create({ data: req.body });
    res.status(201).json(due);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
