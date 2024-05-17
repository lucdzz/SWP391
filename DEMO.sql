--Create database SWP391DEMO

-- Create Admin table
CREATE TABLE Admin (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255)
);

-- Create Manager table
CREATE TABLE Manager (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    managed_by_admin VARCHAR(255),
    FOREIGN KEY (managed_by_admin) REFERENCES Admin(username)
);

-- Create Teacher table
CREATE TABLE Teacher (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    department VARCHAR(255),
    managed_by_manager VARCHAR(255),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);

-- Create Student table
CREATE TABLE Student (
    username VARCHAR(255) PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    date_of_birth DATE,
    managed_by_manager VARCHAR(255),
    FOREIGN KEY (managed_by_manager) REFERENCES Manager(username)
);

-- Create Semester table
CREATE TABLE Semester (
    semester_name VARCHAR(255) PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

-- Create Course table with updated primary key
CREATE TABLE Course (
    course_code VARCHAR(255),
    title VARCHAR(255),
    semester_name VARCHAR(255),
    teacher_username VARCHAR(255),
    PRIMARY KEY (course_code, semester_name),
    FOREIGN KEY (semester_name) REFERENCES Semester(semester_name),
    FOREIGN KEY (teacher_username) REFERENCES Teacher(username)
);

-- Create Class table
CREATE TABLE Class (
    class_id VARCHAR(255) PRIMARY KEY,
    course_code VARCHAR(255),
    semester_name VARCHAR(255),
    room VARCHAR(255),
    FOREIGN KEY (course_code, semester_name) REFERENCES Course(course_code, semester_name)
);

-- Create Quiz table
CREATE TABLE Quiz (
    quiz_id VARCHAR(255) PRIMARY KEY,
    class_id VARCHAR(255),
    date DATE,
    duration INT,
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

-- Create Score table
CREATE TABLE Score (
    username VARCHAR(255),
    quiz_id VARCHAR(255),
    score INT,
    PRIMARY KEY (username, quiz_id),
    FOREIGN KEY (username) REFERENCES Student(username) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id) ON DELETE CASCADE
);

-- Create Teaching_Assignments table for many-to-many relationship between Teacher and Class
CREATE TABLE Teaching_Assignments (
    username VARCHAR(255),
    course_code VARCHAR(255),
    semester_name VARCHAR(255),
    PRIMARY KEY (username, course_code, semester_name),
    FOREIGN KEY (username) REFERENCES Teacher(username) ON DELETE CASCADE,
    FOREIGN KEY (course_code, semester_name) REFERENCES Course(course_code, semester_name) ON DELETE CASCADE
);

-- Create Enrollment table for many-to-many relationship between Student and Class
CREATE TABLE Enrollment (
    username VARCHAR(255),
    class_id VARCHAR(255),
    PRIMARY KEY (username, class_id),
    FOREIGN KEY (username) REFERENCES Student(username) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES Class(class_id) ON DELETE CASCADE
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

-- Insert data into Student table
INSERT INTO Student (username, password, name, email, date_of_birth, managed_by_manager)
VALUES ('student01', 'studentpass', 'Dave Student', 'dave.student@example.com', '2000-01-01', 'manager01');

-- Insert data into Semester table
INSERT INTO Semester (semester_name, start_date, end_date)
VALUES ('Fall 2023', '2023-09-01', '2023-12-15');

-- Insert data into Course table
INSERT INTO Course (course_code, title, semester_name)
VALUES ('MATH101', 'Introduction to Algebra', 'Fall 2023');

-- Insert data into Class table
INSERT INTO Class (class_id, course_code, semester_name, room)
VALUES ('class01', 'MATH101', 'Fall 2023', 'Room 101');

-- Insert data into Quiz table
INSERT INTO Quiz (quiz_id, class_id, date, duration)
VALUES ('quiz01', 'class01', '2023-10-10', 90);

-- Insert data into Score table
INSERT INTO Score (username, quiz_id, score)
VALUES ('student01', 'quiz01', 85);

-- Insert data into Teaching_Assignments table
INSERT INTO Teaching_Assignments (username, course_code, semester_name)
VALUES ('teacher01', 'MATH101', 'Fall 2023');

-- Insert data into Enrollment table
INSERT INTO Enrollment (username, class_id)
VALUES ('student01', 'class01');
