const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getInternalMarks = async (req, res) => {
  try {
    const marks = await prisma.internalMark.findMany();
    res.json(marks);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createInternalMark = async (req, res) => {
  try {
    const mark = await prisma.internalMark.create({ data: req.body });
    res.status(201).json(mark);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
