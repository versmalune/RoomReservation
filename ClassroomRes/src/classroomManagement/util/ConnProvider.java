package classroomManagement.util;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnProvider {
	
	public static Connection getConnection() {
		Connection conn = null;
		Context ct = null;
		DataSource ds = null;
		
		try {
			ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/swe");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return conn;
	}
}