const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getNotes = async (req, res) => {
  try {
    const notes = await prisma.note.findMany();
    res.json(notes);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createNote = async (req, res) => {
  try {
    const note = await prisma.note.create({ data: req.body });
    res.status(201).json(note);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
