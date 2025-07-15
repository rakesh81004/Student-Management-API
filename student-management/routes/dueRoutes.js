const express = require('express');
const router = express.Router();
const controller = require('../controllers/dueController');

router.get('/', controller.getDues);
router.post('/', controller.createDue);

module.exports = router;
