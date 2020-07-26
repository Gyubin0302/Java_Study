``` java  
package com.bit.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * instance가 한번만 만들어지도록...
 * @author bitcamp
 *
 */
public  class DBConnection {
	private static Connection conn;
	public final static DBConnection instance;
	
	static {
		instance = new DBConnection();
	}
	
	public static DBConnection getInstance() {
		return instance; 
	}
	
	public static Connection getConnection() {
		return conn;
	}

	private DBConnection() {
		
		System.out.println("DBConnection");
		// 1. Driver load.
		// 2. Connection -> db가 어디있고 username, pw을 사용해서 들어갈거다.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:orcl", 
				   user = "bankadmin",
			       password = "1234"; // jdbc oracle의 thin tpye으로 쓰로 @~~주소로 db에 접속할거야.
			// 3. 접속권한
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("접속 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException ex) {
				System.out.println("connection 장애");
			}
			
		}finally { // Exception이 발생하던 발생하지않던 finally는 무조건 거처간다.
			
		}
	}
	
	public DBConnection(String msg) {
		System.out.println("DBConnection(String msg)");
		
	}
	

}
```