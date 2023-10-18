package Conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:mysql://localhost:3306/Cadastros?user=root&password=";
	private static Connection connection;

	public static Connection getConnection() {
	    if (connection == null) {
	        try {
	            // Carregar o driver JDBC do MySQL (certifique-se de que o driver esteja no classpath)
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            // Estabelecer a conexão com o banco de dados
	            connection = DriverManager.getConnection(URL);
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return connection;
	}

	public static void closeConnection() {
	    if (connection != null) {
	        try {
	            connection.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	}
}