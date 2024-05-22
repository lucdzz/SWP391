--Create database SWP391DEMO

-- Create Admin table
CREATE TABLE Admin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255)
);

-- Create Manager table
CREATE TABLE Manager (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    managed_by_admin VARCHAR(50),
    FOREIGN KEY (managed_by_admin) REFERENCES Admin(username)
);

-- Create Teacher table
CREATE TABLE Teacher (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    department VARCHAR(255),
    managed_by_manager VARCHAR(50),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);

-- Create Student table
CREATE TABLE Student (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    date_of_birth DATE,
    managed_by_manager VARCHAR(50),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);

-- Create Semester table
CREATE TABLE Semester (
    semester_name VARCHAR(50) PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- Create Course table
CREATE TABLE Course (
    course_code VARCHAR(50),
    title VARCHAR(255),
    semester_name VARCHAR(50),
    PRIMARY KEY (course_code, semester_name),
    FOREIGN KEY (semester_name) REFERENCES Semester(semester_name)
);

-- Create Class table
CREATE TABLE Class (
    class_id VARCHAR(50),
    course_code VARCHAR(50),
    semester_name VARCHAR(50),
    room VARCHAR(255),
    PRIMARY KEY (class_id, course_code, semester_name),
    FOREIGN KEY (course_code, semester_name) REFERENCES Course(course_code, semester_name)
);

-- Create Quiz table
CREATE TABLE Quiz (
    quiz_id VARCHAR(50) PRIMARY KEY,
    class_id VARCHAR(50),
    course_code VARCHAR(50),
    semester_name VARCHAR(50),
    date DATE,
    duration INT,
    FOREIGN KEY (class_id, course_code, semester_name) REFERENCES Class(class_id, course_code, semester_name)
);

-- Create Score table
CREATE TABLE Score (
    username VARCHAR(50),
    quiz_id VARCHAR(50),
    score INT,
    PRIMARY KEY (username, quiz_id),
    FOREIGN KEY (username) REFERENCES Student(username) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id) ON DELETE CASCADE
);

-- Create Teaching_Assignments table for many-to-many relationship between Teacher, Class, and Course
CREATE TABLE Teaching_Assignments (
    username VARCHAR(50),
    class_id VARCHAR(50),
    course_code VARCHAR(50),
    semester_name VARCHAR(50),
    PRIMARY KEY (username, class_id, course_code, semester_name),
    FOREIGN KEY (username) REFERENCES Teacher(username) ON DELETE CASCADE,
    FOREIGN KEY (class_id, course_code, semester_name) REFERENCES Class(class_id, course_code, semester_name) ON DELETE CASCADE
);

-- Create Enrollment table for many-to-many relationship between Student and Class
CREATE TABLE Enrollment (
    username VARCHAR(50),
    class_id VARCHAR(50),
    course_code VARCHAR(50),
    semester_name VARCHAR(50),
    PRIMARY KEY (username, class_id, course_code, semester_name),
    FOREIGN KEY (username) REFERENCES Student(username) ON DELETE CASCADE,
    FOREIGN KEY (class_id, course_code, semester_name) REFERENCES Class(class_id, course_code, semester_name) ON DELETE CASCADE
);

-- Insert data into Admin table
INSERT INTO Admin (username, password, name, email)
VALUES ('admin01', 'adminpass', 'Alice Admin', 'alice.admin@example.com');

-- Insert data into Manager table
INSERT INTO Manager (username, password, name, email, managed_by_admin)
VALUES ('manager01', 'managerpass', 'Bob Manager', 'bob.manager@example.com', 'admin01');

-- Insert data into Teacher table
INSERT INTO Teacher (username, password, name, email, department, managed_by_manager)
VALUES ('teacher01', 'teacherpass', 'Carol Teacher', 'carol.teacher@example.com', 'Mathematics', 'manager01');
INSERT INTO Teacher (username, password, name, email, department, managed_by_manager)
VALUES ('teacher02', 'teacherpass2', 'Eve Teacher', 'eve.teacher@example.com', 'Physics', 'manager01');

-- Insert data into Student table
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES ('student01', 'studentpass', 'Dave Student', 'dave.student@example.com', '2000-01-01', 'manager01');
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES ('student02', 'studentpass2', 'Frank Student', 'frank.student@example.com', '2001-02-02', 'manager01');
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES('student03', 'studentpass3', 'Grace Student', 'grace.student@example.com', '2002-03-03', 'manager01');
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES('student04', 'studentpass4', 'Hank Student', 'hank.student@example.com', '2003-04-04', 'manager01');

-- Insert data into Semester table
INSERT INTO Semester (semester_name, start_date, end_date)
VALUES ('Fall 2023', '2023-09-01', '2023-12-15');

-- Insert data into Course table
INSERT INTO Course (course_code, title, semester_name)
VALUES ('MATH101', 'Introduction to Algebra', 'Fall 2023');
INSERT INTO Course (course_code, title, semester_name)
VALUES ('PRJ391', 'Project Management', 'Fall 2023');

-- Insert data into Class table
INSERT INTO Class (class_id, course_code, semester_name, room)
VALUES ('class01', 'MATH101', 'Fall 2023', 'Room 101');
INSERT INTO Class (class_id, course_code, semester_name, room)
VALUES ('class01', 'PRJ391', 'Fall 2023', 'Room 101');

-- Insert data into Quiz table
INSERT INTO Quiz (quiz_id, class_id, course_code, semester_name, date, duration)
VALUES ('quiz01', 'class01', 'MATH101', 'Fall 2023', '2023-10-10', 90);

-- Insert data into Score table
INSERT INTO Score (username, quiz_id, score)
VALUES ('student01', 'quiz01', 85);

-- Insert data into Teaching_Assignments table
INSERT INTO Teaching_Assignments (username, class_id, course_code, semester_name)
VALUES ('teacher01', 'class01', 'MATH101', 'Fall 2023');
INSERT INTO Teaching_Assignments (username, class_id, course_code, semester_name)
VALUES ('teacher02', 'class01', 'PRJ391', 'Fall 2023');

-- Insert data into Enrollment table
INSERT INTO Enrollment (username, class_id, course_code, semester_name)
VALUES ('student01', 'class01', 'MATH101', 'Fall 2023');
INSERT INTO Enrollment (username, class_id, course_code, semester_name)
VALUES ('student02', 'class01', 'MATH101', 'Fall 2023');
INSERT INTO Enrollment (username, class_id, course_code, semester_name)
VALUES ('student03', 'class01', 'MATH101', 'Fall 2023');
INSERT INTO Enrollment (username, class_id, course_code, semester_name)
VALUES ('student04', 'class01', 'MATH101', 'Fall 2023');
