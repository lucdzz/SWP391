package DAL;

import Model.Admin;
import Model.Course;
import Model.Manager;
import Model.Semester;
import Model.Student;
import Model.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO extends DBContext {

    public Object authenticateUser(String username, String password) {
        Object user = null;
        // Check Admin
        user = authenticateAdmin(username, password);
        if (user != null) {
            return user;
        }
        // Check Manager
        user = authenticateManager(username, password);
        if (user != null) {
            return user;
        }
        // Check Teacher
        user = authenticateTeacher(username, password);
        if (user != null) {
            return user;
        }
        // Check Student
        user = authenticateStudent(username, password);
        return user;
    }

    public Admin authenticateAdmin(String username, String password) {
        String sql = "SELECT * FROM Admin WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                return new Admin(username, password, name, email);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Manager authenticateManager(String username, String password) {
        String sql = "SELECT * FROM Manager WHERE username = ? AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet resultSet = ps.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String managedByAdmin = resultSet.getString("managed_by_admin");
                return new Manager(username, password, name, email, managedByAdmin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Teacher authenticateTeacher(String username, String password) {
        String query = "SELECT * FROM Teacher WHERE username = ? AND password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String department = resultSet.getString("department");
                String managedByManager = resultSet.getString("managed_by_manager");
                return new Teacher(username, password, name, email, department, managedByManager);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public Student authenticateStudent(String username, String password) {
        String query = "SELECT * FROM Student WHERE username = ? AND password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String dateOfBirth = resultSet.getString("date_of_birth");
                String managedByManager = resultSet.getString("managed_by_manager");
                return new Student(username, password, name, email, dateOfBirth, managedByManager);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    ///////Semester
//    public boolean createSemester(String semesterName, String startDate, String endDate) {
//        String sql = "INSERT INTO Semester (semester_name, start_date, end_date) VALUES (?, ?, ?)";
//        try (
//                PreparedStatement ps = connection.prepareStatement(sql)) {
//
//            ps.setString(1, semesterName);
//            ps.setString(2, startDate);
//            ps.setString(3, endDate);
//
//            int rowsAffected = ps.executeUpdate();
//            return rowsAffected > 0;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return false;
//        }
//    }
    public List<Semester> getAllSemesters() {
        List<Semester> semesters = new ArrayList<>();
        String sql = "SELECT * FROM Semester";

        try (
                PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String semesterName = rs.getString("semester_name");
                String startDate = rs.getString("start_date");
                String endDate = rs.getString("end_date");
                semesters.add(new Semester(semesterName, startDate, endDate));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return semesters;
    }

    public boolean createSemester(String semesterName, String startDate, String endDate) {
        String sql = "INSERT INTO Semester (semester_name, start_date, end_date) VALUES (?, ?, ?)";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, semesterName);
            ps.setString(2, startDate);
            ps.setString(3, endDate);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public  Semester getSemester(String semesterName) {
        String sql = "SELECT * FROM Semester WHERE semester_name = ?";
        try (
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, semesterName);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String startDate = rs.getString("start_date");
                String endDate = rs.getString("end_date");
                return new Semester(semesterName, startDate, endDate);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public  boolean updateSemester(String semesterName, String startDate, String endDate) {
        String sql = "UPDATE Semester SET start_date = ?, end_date = ? WHERE semester_name = ?";
        try (
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, startDate);
            ps.setString(2, endDate);
            ps.setString(3, semesterName);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

     public boolean deleteSemester(String semesterName) {
        Connection connection = null;
        PreparedStatement psCourse = null;
        PreparedStatement psSemester = null;
        try {
            
            connection.setAutoCommit(false); // Bắt đầu transaction

            // Xóa các khóa học liên quan trước
            String sqlDeleteCourses = "DELETE FROM Course WHERE semester_name = ?";
            psCourse = connection.prepareStatement(sqlDeleteCourses);
            psCourse.setString(1, semesterName);
            psCourse.executeUpdate();

            // Xóa học kỳ
            String sqlDeleteSemester = "DELETE FROM Semester WHERE semester_name = ?";
            psSemester = connection.prepareStatement(sqlDeleteSemester);
            psSemester.setString(1, semesterName);
            psSemester.executeUpdate();

            connection.commit(); // Commit transaction

            return true;
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback(); // Rollback transaction nếu có lỗi
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } 
    }

    //////Course
    public List<Course> getCoursesForTeacher(String teacherUsername) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_code, c.title, c.semester_name "
                + "FROM Course c "
                + "JOIN Class cl ON c.course_code = cl.course_code "
                + "JOIN Teaching_Assignments ta ON cl.class_id = ta.class_id "
                + "WHERE ta.username = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, teacherUsername);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String courseCode = rs.getString("course_code");
                String title = rs.getString("title");
                String semesterName = rs.getString("semester_name");
                courses.add(new Course(courseCode, title, semesterName));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public List<Course> getCoursesForStudent(String studentUsername) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT c.course_code, c.title, c.semester_name "
                + "FROM Course c "
                + "JOIN Class cl ON c.course_code = cl.course_code "
                + "JOIN Enrollment e ON cl.class_id = e.class_id "
                + "WHERE e.username = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, studentUsername);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String courseCode = rs.getString("course_code");
                String title = rs.getString("title");
                String semesterName = rs.getString("semester_name");
                courses.add(new Course(courseCode, title, semesterName));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public boolean createCourse(String courseCode, String title, String semesterName) {
        String sql = "INSERT INTO Course (course_code, title, semester_name) VALUES (?, ?, ?)";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, courseCode);
            ps.setString(2, title);
            ps.setString(3, semesterName);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCourse(String courseCode, String title, String semesterName) {
        String sql = "UPDATE Course SET title = ?, semester_name = ? WHERE course_code = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, title);
            ps.setString(2, semesterName);
            ps.setString(3, courseCode);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteCourse(String courseCode) {
        String sql = "DELETE FROM Course WHERE course_code = ?";
        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, courseCode);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public  Course getCourse(String courseCode) {
        String sql = "SELECT * FROM Course WHERE course_code = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, courseCode);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String title = rs.getString("title");
                String semesterName = rs.getString("semester_name");
                return new Course(courseCode, title, semesterName);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    public List<Course> getCoursesForSemester(String semesterName) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM Course WHERE semester_name = ?";

        try (
                PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, semesterName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String courseCode = rs.getString("course_code");
                String title = rs.getString("title");
                courses.add(new Course(courseCode, title, semesterName));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public List<Teacher> getAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        String sql = "SELECT * FROM Teacher";

        try (PreparedStatement ps = connection.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String department = rs.getString("department");
                String managedByManager = rs.getString("managed_by_manager");
                teachers.add(new Teacher(username, password, name, email, department, managedByManager));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return teachers;
    }

    public boolean assignTeacherToCourse(String teacherUsername, String courseCode) {
        String sql = "INSERT INTO Teaching_Assignments (username, class_id) VALUES (?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, teacherUsername);
            ps.setString(2, courseCode);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
