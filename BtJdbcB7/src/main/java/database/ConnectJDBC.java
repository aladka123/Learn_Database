package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectJDBC {
    private String hostName = "localhost : 8085";
    private String dbname = "sakila";
    private String username = "root";
    private String password = "123";

    private String connectionURL = "jdbc:mysql://"+hostName+"/"+dbname;

    public Connection connect(){
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(connectionURL, username, password);
            System.out.println("Ket noi thanh cong!");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
