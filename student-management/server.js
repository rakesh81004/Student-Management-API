const express = require('express');
const dotenv = require('dotenv');
const app = express();
dotenv.config();

app.use(express.json());

// Student Management Routes
app.use('/api/students', require('./routes/studentRoutes'));
app.use('/api/subjects', require('./routes/subjectRoutes'));
app.use('/api/assignments', require('./routes/assignmentRoutes'));
app.use('/api/internal-marks', require('./routes/internalMarkRoutes'));
app.use('/api/results', require('./routes/semesterResultRoutes'));
app.use('/api/dues', require('./routes/dueRoutes'));
app.use('/api/notes', require('./routes/noteRoutes'));
app.use('/api/circulars', require('./routes/circularRoutes'));
app.use('/api/events', require('./routes/eventRoutes'));
app.use('/api/timetable', require('./routes/timetableRoutes'));
app.use('/api/approvals', require('./routes/approvalRoutes'));
app.use('/api/transactions', require('./routes/transactionRoutes'));

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`✅ Server running on http://localhost:${PORT}`);
});
