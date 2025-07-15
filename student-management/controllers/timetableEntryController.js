const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getTimetable = async (req, res) => {
  try {
    const entries = await prisma.timeTableEntry.findMany();
    res.json(entries);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createEntry = async (req, res) => {
  try {
    const entry = await prisma.timeTableEntry.create({ data: req.body });
    res.status(201).json(entry);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
