//const { PrismaClient } = require('@prisma/client');
const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

exports.getApprovals = async (req, res) => {
  try {
    const approvals = await prisma.approval.findMany();
    res.json(approvals);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

exports.createApproval = async (req, res) => {
  try {
    const approval = await prisma.approval.create({ data: req.body });
    res.status(201).json(approval);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};
