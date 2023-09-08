package DBPKG;

import java.sql.*; 

public class Util {
	
	
	// 데이터 베이스 정보를 여기에 저장한것
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
		 ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		return con;
		}
	
	
}
