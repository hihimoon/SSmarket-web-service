package backendweb.d01_dao;

import java.sql.*;

public class DBCon {
	// 데이터베이스 서버 연동처리
	// 1. 연동 기능 메서드
	
	private static final String URL = "jdbc:oracle:thin:@211.63.89.67:1521:Xe";
	// 								   드라이버정보:@ip:port:DB명
	private static final String USERNAME = "team2";
	private static final String PASSWORD = "2222";
	public static Connection con() throws SQLException, ClassNotFoundException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(URL, USERNAME, PASSWORD);
	
	}
	
	// 2. DB 처리한 후, 자원을 해제하는 공통 기능 메서드
	//	  AutoCloseable... resources : 여러개의 객체를 매개변수로 받아서 처리할 때, 사용하는 형태를 배열로 받는다.
	public static void close(AutoCloseable... resources) {
		for(AutoCloseable resource:resources) {
			if(resources!=null) {
				try {
					resource.close();
				}catch (Exception e) {
					// TODO: handle exception
					// 해당 클래스의 예외가 나올 때 처리
					System.out.println(resource.getClass().getSimpleName());
					System.out.println("닫기 실패");
				}
			}
		}
		System.out.println("자원해제처리!");
	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
//		try {
//			close(con());
//			System.out.println("접속성공!");
//		}catch (Exception e) {
//			// TODO: handle exception
//			System.out.println("에러발생: " + e.getMessage());
//		}
	}

}
