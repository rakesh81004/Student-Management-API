const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getResults = async (req, res) => {
  try {
    const results = await prisma.semesterResult.findMany();
    res.json(results);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createResult = async (req, res) => {
  try {
    const result = await prisma.semesterResult.create({ data: req.body });
    res.status(201).json(result);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
