const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.createSubject = async (req, res) => {
  try {
    const { subject_code, subject_name, regulation, semester } = req.body;

    if (!subject_code || !subject_name || !regulation || semester === undefined) {
      return res.status(400).json({ error: "Missing required fields" });
    }

    const subject = await prisma.subject.create({
      data: {
        subject_code: subject_code,
        subject_name: subject_name,
        regulation: regulation,
        semester: Number(semester)
      }
    });

    res.status(201).json(subject);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};


exports.getSubjects = async (req, res) => {
  try {
    const subjects = await prisma.subject.findMany();
    res.json(subjects);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
exports.deleteSubject = async (req, res) => {
  try {
    await prisma.subject.delete({
      where: { subject_code: req.params.id }
    });

    res.json({ message: 'Subject deleted successfully' });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
