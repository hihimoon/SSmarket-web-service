//Chat_SSMarketProjectDBCon
package JangSunWoong;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Chat_SSMarketProjectDBCon 
{
	private static final String URL="jdbc:oracle:thin:@211.63.89.67:1521:xe";
	private static final String USERNAME="team2";
	private static final String PASSWORD="2222";
	
	public static Connection con() throws ClassNotFoundException, SQLException
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(URL,USERNAME,PASSWORD);
	}
	
	public static void close(AutoCloseable ... resources)
	{
		for(AutoCloseable resource:resources)
		{
			if(resource!=null)
			{
				try 
				{
					resource.close();
				} 
				catch (Exception e) 
				{
					System.out.print(resource.getClass().getSimpleName());
					System.out.println("닫기 실패");
				}
			}
		}
		System.out.println("자원해제처리!");
	}
	
	
	
	
	public static void main(String[] args) 
	{


	}
}
