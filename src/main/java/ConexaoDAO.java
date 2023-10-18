import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConexaoDAO {

	public Connection Connection () throws ClassNotFoundException {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url ="jdbc:mysql://localhost:3306/userdb? user=root&password=";
			con = DriverManager.getConnection(url);
		} catch (SQLException e) {
			System.out.print(e.getMessage());
		}
		return con;
		
		
		
		
		
		
	}
}
