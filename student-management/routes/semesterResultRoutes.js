const express = require('express');
const router = express.Router();
const controller = require('../controllers/semesterResultController');

router.get('/', controller.getResults);
router.post('/', controller.createResult);

module.exports = router;
