package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCDemo {
	public static final String username = "mikejfromva";
	public static final String password = "";

	public static void main(String[] args) {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return;
		}

		try {
			Connection con = DriverManager.getConnection(
					"jdbc:postgresql://localhost:5432/postgres", username,
					password);

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT p_min, p_descript FROM product");

			while (rs.next()) {
				int x = rs.getInt("p_min");
				String s = rs.getString("p_descript");
				System.out.println("Product: " + s + " Minimum On Hand: " + x);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
