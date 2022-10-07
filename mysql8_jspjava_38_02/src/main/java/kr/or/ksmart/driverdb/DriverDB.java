package kr.or.ksmart.driverdb;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DriverDB {
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01_02_driver_DB¿¬°á driverDbcon DriverDB.java");
		Class.forName("com.mysql.jdbc.Driver");
		String jdbcDriver = "jdbc:mysql://localhost:3306/dev00db?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "dev00id";
		String dbPass = "dev00pw";
		Connection conn2 = null;
		conn2 = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn2 + "<-- conn2 driverDbcon DriverDB.java");
		return conn2;
	}
}
