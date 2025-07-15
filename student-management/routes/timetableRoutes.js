const express = require('express');
const router = express.Router();
const controller = require('../controllers/timetableEntryController');

router.get('/', controller.getTimetable);
router.post('/', controller.createEntry);

module.exports = router;
