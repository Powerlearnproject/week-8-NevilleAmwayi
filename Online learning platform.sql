-- CREATE DATABASE online_learning_platform;

-- USE online_learning_platform;

-- CREATE TABLE User (
--     LearnerID INT AUTO_INCREMENT PRIMARY KEY,
--     Name VARCHAR(100),
--     Email VARCHAR(100) UNIQUE,
--     Password VARCHAR(255),
--     Role ENUM('student', 'teacher'),
--     LanguagePreference VARCHAR(50),
--     TeacherID INT DEFAULT NULL,
--     StudentID INT DEFAULT NULL,
--     FOREIGN KEY (TeacherID) REFERENCES User(LearnerID),
--     FOREIGN KEY (StudentID) REFERENCES User(LearnerID)
-- );

-- CREATE TABLE Course (
--     CourseID INT AUTO_INCREMENT PRIMARY KEY,
--     CourseName VARCHAR(100) UNIQUE
-- );

-- CREATE TABLE Enrollment (
--     EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
--     StudentID INT,
--     CourseID INT,
--     EnrollmentDate DATE,
--     ProgressPercentage INT,
--     CompletionStatus ENUM('In Progress', 'Complete'),
--     FOREIGN KEY (StudentID) REFERENCES User(LearnerID),
--     FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
-- );

-- CREATE TABLE Attendance (
--     AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
--     StudentID INT,
--     CourseID INT,
--     Date DATE,
--     Status ENUM('Present', 'Absent'),
--     FOREIGN KEY (StudentID) REFERENCES User(LearnerID),
--     FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
-- );

-- CREATE TABLE Assessment (
--     AssessmentID INT AUTO_INCREMENT PRIMARY KEY,
--     CourseID INT,
--     AssessmentType ENUM('Quiz', 'Assignment', 'Exam'),
--     Marks DECIMAL(5, 2),
--     FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
-- );

-- CREATE TABLE TeacherCourse (
--     ID INT AUTO_INCREMENT PRIMARY KEY,
--     TeacherID INT,
--     CourseID INT,
--     FOREIGN KEY (TeacherID) REFERENCES User(LearnerID),
--     FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
-- );
-- ALTER TABLE user MODIFY COLUMN teacherid INT NULL;
-- ALTER TABLE user MODIFY COLUMN studentid INT NULL;

-- ALTER TABLE user
-- MODIFY COLUMN Role VARCHAR(255);

-- TRUNCATE TABLE course;

-- ALTER TABLE enrollment DROP FOREIGN KEY enrollment_ibfk_2;

-- DROP TABLE course; 

-- ALTER TABLE enrollment
-- ADD CONSTRAINT enrollment_ibfk_2
-- FOREIGN KEY (courseID) REFERENCES course(courseID);

-- INSERT INTO course (courseID, courseName)
-- VALUES (2, 'Data Science');

-- SELECT u.Name, c.CourseID, e.ProgressPercentage
-- FROM user u
-- JOIN enrollment e ON u.studentid = e.StudentID
-- JOIN course c ON e.CourseID = c.CourseID
-- WHERE u.Role = 'Student';

-- SELECT *
-- FROM course
-- JOIN enrollment ON course.CourseID = enrollment.CourseID
-- WHERE enrollment.StudentID = 182;

-- SELECT enrollment.ProgressPercentage, enrollment.CompletionStatus
-- FROM enrollment
-- WHERE enrollment.StudentID = 191 AND enrollment.CourseID = 2;

-- SELECT *
-- FROM assessment
-- JOIN course ON assessment.AssessmentID = course.CourseID
-- WHERE assessment.CourseID = 3;

-- SELECT AVG(ProgressPercentage) AS AverageCompletionRate
-- FROM enrollment;

-- SELECT assessment.AssessmentID, COUNT(assessment.Marks) AS NumberOfResults,
--        AVG(assessment.Marks) AS AverageScore
-- FROM assessment
-- JOIN course ON assessment.AssessmentID = course.CourseID
-- GROUP BY assessment.AssessmentID;

-- SELECT course.CourseID, course.CourseName, COUNT(enrollment.StudentID) AS EnrollmentCount
-- FROM course
-- JOIN enrollment ON course.CourseID = enrollment.CourseID
-- GROUP BY course.CourseID, course.CourseName
-- ORDER BY EnrollmentCount DESC;

-- SELECT c.CourseID, c.CourseName
-- FROM course c
-- JOIN enrollment e ON c.CourseID = e.CourseID
-- WHERE e.StudentID = 191; 

-- SELECT e.StudentID, c.CourseName, e.ProgressPercentage, e.CompletionStatus
-- FROM enrollment e
-- JOIN course c ON e.CourseID = c.CourseID
-- WHERE e.CourseID = 2 AND e.StudentID = 191;

-- SELECT a.AssessmentID, a.AssessmentType, a.Marks
-- FROM assessment a
-- WHERE a.CourseID = 2;

-- SELECT a.CourseID, a.AssessmentType, AVG(a.Marks) AS AverageMarks
-- FROM assessment a
-- GROUP BY a.CourseID, a.AssessmentType;

-- SELECT c.CourseName, COUNT(e.StudentID) AS NumberOfEnrollments
-- FROM course c
-- LEFT JOIN enrollment e ON c.CourseID = e.CourseID
-- GROUP BY c.CourseName
-- ORDER BY NumberOfEnrollments DESC;

-- SELECT a.CourseID, a.AssessmentType, AVG(a.Marks) AS AverageMarks
-- FROM assessment a
-- GROUP BY a.CourseID, a.AssessmentType;

-- SELECT a.StudentID, u.Name, a.Date, a.Status
-- FROM attendance a
-- JOIN user u ON a.StudentID = u.LearnerID
-- WHERE a.CourseID = 1; 

-- SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount
-- FROM course c
-- LEFT JOIN enrollment e ON c.CourseID = e.CourseID
-- GROUP BY c.CourseName;

-- SELECT u.LearnerID, u.Name, COUNT(e.CourseID) AS CoursesInProgress
-- FROM user u
-- LEFT JOIN enrollment e ON u.LearnerID = e.StudentID
-- WHERE e.CompletionStatus = 'In Progress'
-- GROUP BY u.LearnerID, u.Name
-- HAVING CoursesInProgress < 100;

-- SELECT c.CourseName, AVG(CASE WHEN a.Status = 'Present' THEN 1 ELSE 0 END) * 100 AS AttendancePercentage
-- FROM attendance a
-- JOIN course c ON a.CourseID = c.CourseID
-- WHERE a.StudentID = 91
-- GROUP BY c.CourseName;






 














