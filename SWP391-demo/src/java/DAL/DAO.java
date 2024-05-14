package DAL;

import Model.Admin;
import Model.Manager;
import Model.Student;
import Model.Teacher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
