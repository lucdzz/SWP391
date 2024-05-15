--create database SWP391_DEMO;
--go
-- Tạo bảng Admin
CREATE TABLE Admin (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255)
);

-- Tạo bảng Manager
CREATE TABLE Manager (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    managed_by_admin VARCHAR(255),
    FOREIGN KEY (managed_by_admin) REFERENCES Admin(username)
);

-- Tạo bảng Teacher
CREATE TABLE Teacher (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    department VARCHAR(255),
    managed_by_manager VARCHAR(255),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);

-- Tạo bảng Student
CREATE TABLE Student (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    date_of_birth DATE,
    managed_by_manager VARCHAR(255),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);


-- Tạo bảng Semester
CREATE TABLE Semester (
    semester_name VARCHAR(255) PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- Tạo bảng Course
CREATE TABLE Course (
    course_code VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    semester_name VARCHAR(255),
    FOREIGN KEY (semester_name) REFERENCES Semester(semester_name)
);

-- Tạo bảng Class
CREATE TABLE Class (
    class_id VARCHAR(255) PRIMARY KEY,
    course_code VARCHAR(255),
    semester_name VARCHAR(255),
    room VARCHAR(255),
    FOREIGN KEY (course_code) REFERENCES Course(course_code),
    FOREIGN KEY (semester_name) REFERENCES Semester(semester_name)
);

-- Tạo bảng Quiz
CREATE TABLE Quiz (
    quiz_id VARCHAR(255) PRIMARY KEY,
    class_id VARCHAR(255),
    date DATE,
    duration INT,
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Tạo bảng Score
CREATE TABLE Score (
    username VARCHAR(255),
    quiz_id VARCHAR(255),
    score INT,
    PRIMARY KEY (username, quiz_id),
    FOREIGN KEY (username) REFERENCES Student(username),
    FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id)
);

-- Tạo bảng trung gian Teaching_Assignments cho mối quan hệ nhiều-nhiều giữa Teacher và Class
CREATE TABLE Teaching_Assignments (
    username VARCHAR(255),
    class_id VARCHAR(255),
    PRIMARY KEY (username, class_id),
    FOREIGN KEY (username) REFERENCES Teacher(username),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Tạo bảng trung gian Enrollment cho mối quan hệ nhiều-nhiều giữa Student và Class
CREATE TABLE Enrollment (
    username VARCHAR(255),
    class_id VARCHAR(255),
    PRIMARY KEY (username, class_id),
    FOREIGN KEY (username) REFERENCES Student(username),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);
-- Chèn dữ liệu cho bảng Admin
INSERT INTO Admin (username, password, name, email)
VALUES ('admin01', '123', 'Alice Admin', 'admin@fpt.edu.vn');

-- Chèn dữ liệu cho bảng Manager
INSERT INTO Manager (username, password, name, email, managed_by_admin)
VALUES ('manager01', '123', 'Bob Manager','manager01@fpt.edu.vn', 'admin01');

-- Chèn dữ liệu cho bảng Teacher
INSERT INTO Teacher (username, password, name, email, department, managed_by_manager)
VALUES ('teacher01', 'teacherpass', 'Carol Teacher', 'teacher01@fpt.edu.vn', 'Mathematics', 'manager01');

-- Chèn dữ liệu cho bảng Student
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES ('student01', 'studentpass', 'Dave Student', 'student01@fpt.edu.vn', '2000-01-01', 'manager01');

-- Chèn dữ liệu cho bảng Semester
INSERT INTO Semester (semester_name, start_date, end_date)
VALUES ('Fall 2023', '2023-09-01', '2023-12-15');

-- Chèn dữ liệu cho bảng Course
INSERT INTO Course (course_code, title, semester_name)
VALUES ('MATH101', 'Introduction to Algebra', 'Fall 2023');

-- Chèn dữ liệu cho bảng Class
INSERT INTO Class (class_id, course_code, semester_name, room)
VALUES ('class01', 'MATH101', 'Fall 2023', 'Room 101');

-- Chèn dữ liệu cho bảng Quiz
INSERT INTO Quiz (quiz_id, class_id, date, duration)
VALUES ('quiz01', 'class01', '2023-10-10', 90);

-- Chèn dữ liệu cho bảng Score
INSERT INTO Score (username, quiz_id, score)
VALUES ('student01', 'quiz01', 85);

-- Chèn dữ liệu cho bảng Teaching_Assignments
INSERT INTO Teaching_Assignments (username, class_id)
VALUES ('teacher01', 'class01');

-- Chèn dữ liệu cho bảng Enrollment
INSERT INTO Enrollment (username, class_id)
VALUES ('student01', 'class01');
