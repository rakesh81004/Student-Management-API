const express = require('express');
const router = express.Router();
const controller = require('../controllers/subjectController');

router.get('/', controller.getSubjects);
router.post('/', controller.createSubject);
router.delete('/:id', controller.deleteSubject);


module.exports = router;
