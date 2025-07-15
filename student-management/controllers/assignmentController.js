//const { PrismaClient } = require('@prisma/client');
const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getAssignments = async (req, res) => {
  try {
    const assignments = await prisma.assignment.findMany();
    res.json(assignments);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createAssignment = async (req, res) => {
  try {
    const assignment = await prisma.assignment.create({ data: req.body });
    res.status(201).json(assignment);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
    