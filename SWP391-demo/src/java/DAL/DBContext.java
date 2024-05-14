
package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName= SWP391_DEMO";
            String username = "sa";
            String password = "123456789";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    public Connection getConnection() {
        return connection;
    }

    public static void main(String[] args) {
        DBContext dbContext = new DBContext();
        Connection connection = dbContext.getConnection();
        if (connection != null) {
            System.out.println("Connected to SQL Server successfully!");
            try {
                // Close the connection after testing
                connection.close();
            } catch (SQLException ex) {
                System.out.println("Error while closing connection: " + ex.getMessage());
            }
        } else {
            System.out.println("Failed to connect to SQL Server!");
        }
    }
}
