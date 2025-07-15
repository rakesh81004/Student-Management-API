const express = require('express');
const router = express.Router();
const controller = require('../controllers/circularController');

router.get('/', controller.getCirculars);
router.post('/', controller.createCircular);

module.exports = router;
