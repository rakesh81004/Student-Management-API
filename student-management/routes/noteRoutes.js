const express = require('express');
const router = express.Router();
const controller = require('../controllers/noteController');

router.get('/', controller.getNotes);
router.post('/', controller.createNote);

module.exports = router;
