-- CreateTable
CREATE TABLE `Student` (
    `student_id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `register_number` VARCHAR(191) NOT NULL,
    `dob` DATETIME(3) NOT NULL,
    `gender` VARCHAR(191) NOT NULL,
    `department` VARCHAR(191) NOT NULL,
    `course` VARCHAR(191) NOT NULL,
    `batch` VARCHAR(191) NOT NULL,
    `year` VARCHAR(191) NOT NULL,
    `semester` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `accommodation` VARCHAR(191) NOT NULL,
    `cgpa` DOUBLE NOT NULL,
    `attendance_percentage` DOUBLE NOT NULL,
    `arrears` INTEGER NOT NULL,

    UNIQUE INDEX `Student_register_number_key`(`register_number`),
    UNIQUE INDEX `Student_email_key`(`email`),
    PRIMARY KEY (`student_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Subject` (
    `subject_code` VARCHAR(191) NOT NULL,
    `subject_name` VARCHAR(191) NOT NULL,
    `regulation` VARCHAR(191) NOT NULL,
    `semester` INTEGER NOT NULL,

    PRIMARY KEY (`subject_code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Assignment` (
    `assignment_id` INTEGER NOT NULL AUTO_INCREMENT,
    `subject_code` VARCHAR(191) NOT NULL,
    `assignment_name` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `mark` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`assignment_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InternalMark` (
    `internal_mark_id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` VARCHAR(191) NOT NULL,
    `subject_code` VARCHAR(191) NOT NULL,
    `exam_type` VARCHAR(191) NOT NULL,
    `mark_obtained` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`internal_mark_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SemesterResult` (
    `result_id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` VARCHAR(191) NOT NULL,
    `subject_code` VARCHAR(191) NOT NULL,
    `semester_number` INTEGER NOT NULL,
    `grade` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`result_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Circular` (
    `circular_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `year_applicable` VARCHAR(191) NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `download_link` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`circular_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Note` (
    `note_id` INTEGER NOT NULL AUTO_INCREMENT,
    `subject_code` VARCHAR(191) NOT NULL,
    `note_name` VARCHAR(191) NOT NULL,
    `download_link` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`note_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Due` (
    `due_id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` VARCHAR(191) NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `monthly_pay` DOUBLE NOT NULL,
    `total_amount` DOUBLE NOT NULL,
    `paid_amount` DOUBLE NOT NULL,
    `pending_amount` DOUBLE NOT NULL,

    PRIMARY KEY (`due_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Approval` (
    `approval_id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` VARCHAR(191) NOT NULL,
    `faculty` VARCHAR(191) NOT NULL,
    `approved_status` BOOLEAN NOT NULL,

    PRIMARY KEY (`approval_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Transaction` (
    `transaction_id` VARCHAR(191) NOT NULL,
    `student_id` VARCHAR(191) NOT NULL,
    `transaction_date` DATETIME(3) NOT NULL,
    `category` VARCHAR(191) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `method` VARCHAR(191) NOT NULL,
    `receipt_link` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`transaction_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Event` (
    `event_id` INTEGER NOT NULL AUTO_INCREMENT,
    `event_name` VARCHAR(191) NOT NULL,
    `date_day` INTEGER NOT NULL,
    `date_month_abbr` VARCHAR(191) NOT NULL,
    `date_full` VARCHAR(191) NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `location_or_description` VARCHAR(191) NOT NULL,
    `registration_url` VARCHAR(191) NOT NULL,
    `speakers` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`event_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TimeTableEntry` (
    `timetable_entry_id` INTEGER NOT NULL AUTO_INCREMENT,
    `student_id` VARCHAR(191) NOT NULL,
    `day_of_week` VARCHAR(191) NOT NULL,
    `time_slot` VARCHAR(191) NOT NULL,
    `subject_code` VARCHAR(191) NOT NULL,
    `faculty_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`timetable_entry_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Assignment` ADD CONSTRAINT `Assignment_subject_code_fkey` FOREIGN KEY (`subject_code`) REFERENCES `Subject`(`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InternalMark` ADD CONSTRAINT `InternalMark_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InternalMark` ADD CONSTRAINT `InternalMark_subject_code_fkey` FOREIGN KEY (`subject_code`) REFERENCES `Subject`(`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SemesterResult` ADD CONSTRAINT `SemesterResult_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SemesterResult` ADD CONSTRAINT `SemesterResult_subject_code_fkey` FOREIGN KEY (`subject_code`) REFERENCES `Subject`(`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Note` ADD CONSTRAINT `Note_subject_code_fkey` FOREIGN KEY (`subject_code`) REFERENCES `Subject`(`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Due` ADD CONSTRAINT `Due_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Approval` ADD CONSTRAINT `Approval_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Transaction` ADD CONSTRAINT `Transaction_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TimeTableEntry` ADD CONSTRAINT `TimeTableEntry_student_id_fkey` FOREIGN KEY (`student_id`) REFERENCES `Student`(`student_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TimeTableEntry` ADD CONSTRAINT `TimeTableEntry_subject_code_fkey` FOREIGN KEY (`subject_code`) REFERENCES `Subject`(`subject_code`) ON DELETE CASCADE ON UPDATE CASCADE;
