const express = require('express');
const router = express.Router();
const controller = require('../controllers/transactionController');

router.get('/', controller.getTransactions);
router.post('/', controller.createTransaction);

module.exports = router;
