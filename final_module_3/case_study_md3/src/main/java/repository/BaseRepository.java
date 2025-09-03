package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/cinema";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "codegym";
    private static Connection connection =null;
    private BaseRepository() {

    }
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

}
