const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getCirculars = async (req, res) => {
  try {
    const circulars = await prisma.circular.findMany();
    res.json(circulars);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createCircular = async (req, res) => {
  try {
    const circular = await prisma.circular.create({ data: req.body });
    res.status(201).json(circular);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
