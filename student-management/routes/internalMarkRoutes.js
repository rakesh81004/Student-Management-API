const express = require('express');
const router = express.Router();
const controller = require('../controllers/internalMarkController');

router.get('/', controller.getInternalMarks);
router.post('/', controller.createInternalMark);

module.exports = router;
