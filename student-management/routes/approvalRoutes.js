const express = require('express');
const router = express.Router();
const controller = require('../controllers/approvalController');

router.get('/', controller.getApprovals);
router.post('/', controller.createApproval);

module.exports = router;
    