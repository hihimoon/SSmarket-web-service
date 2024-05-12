//Chat_SSMarketProjectDao.java
package JangSunWoong;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import JangSunWoong.Chat_SSMarketVO;

public class Chat_SSMarketProjectDao 
{
	//보내는사람과 받는사람을 기준으로 DB검색해서 결과를 화면에 출력
	public List<Chat_SSMarketVO> getChatListByNickname(String nickname1, String nickname2) 
	{
		List<Chat_SSMarketVO> chatList=new ArrayList<Chat_SSMarketVO>();
		
		String sql="SELECT * FROM CARROTMARKETCHAT \r\n"
				+ "WHERE nickname=? AND nickname2=? OR nickname=? AND nickname2=?\r\n"
				+ "ORDER BY mytime asc";
		
		try(Connection con=Chat_SSMarketProjectDBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,nickname1);
			pstmt.setString(2,nickname2);
			pstmt.setString(3,nickname2);
			pstmt.setString(4,nickname1);
			
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					chatList.add(new Chat_SSMarketVO(rs.getString("nickname"),rs.getString("nickname2"),rs.getString("mymessage"),rs.getTimestamp("mytime")));
				}
				System.out.println("데이터 건수 : "+chatList.size());
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
			System.out.println("SQLException");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
			System.out.println("Exception");
		} 
		return chatList;
	}
	
	
	//채팅입력(데이터 추가) 단, 데이터 수정 불가능
	public int insertChat(Chat_SSMarketVO ins)
	{
		int insCnt=0;
		String sql="INSERT INTO  CARROTMARKETCHAT \r\n"
				+ "values(?,?,?,sysdate)";
		
		try(Connection con=Chat_SSMarketProjectDBCon.con();PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,ins.getNickname());
			pstmt.setString(2,ins.getNickname2());
			pstmt.setString(3,ins.getMymessage());
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				//입력성공
				con.commit();
			}
			else
			{
				//입력실패
				con.rollback();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		return insCnt;
	}
	
	//채팅삭제(데이터 삭제) 단, 데이터 수정 불가능
	public int deleteChat(String del)
	{
		int delCnt=0;
		String sql="DELETE \r\n"
				+ "FROM CARROTMARKETCHAT \r\n"
				+ "WHERE mymessage=?";
		
		try(Connection con=Chat_SSMarketProjectDBCon.con();PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,del);

			delCnt=pstmt.executeUpdate();
			if(delCnt>0)
			{
				//삭제성공
				con.commit();
			}
			else
			{
				//삭제실패
				con.rollback();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		
		return delCnt;
	}

	
	//보내는사람과 받는사람을 기준으로 기존에 존재하는지 판단.
		public boolean existing(String nickname1, String nickname2) 
		{
			boolean alreadyExist=false;
			
			String sql="SELECT * FROM CARROTMARKETCHAT \r\n"
					+ "WHERE nickname=? AND nickname2=? OR nickname=? AND nickname2=?\r\n"
					+ "ORDER BY mytime asc";
			
			try(Connection con=Chat_SSMarketProjectDBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
			{
				pstmt.setString(1,nickname1);
				pstmt.setString(2,nickname2);
				pstmt.setString(3,nickname2);
				pstmt.setString(4,nickname1);
				
				try(ResultSet rs=pstmt.executeQuery();)
				{
					if(rs.next())
					{
						alreadyExist=true;
					}
				}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				System.out.println("SQLException");
			}
			catch (Exception e) 
			{
				e.printStackTrace();
				System.out.println("Exception");
			} 
			return alreadyExist;
		}
		
		
		
		
		
		public List<Chat_SSMarketVO> makeList()
		{
			List<Chat_SSMarketVO> userlist=new ArrayList<Chat_SSMarketVO>();
			String sql="SELECT   nickname,nickname2, max(mytime) mytime\r\n"
					+ "FROM carrotmarketchat\r\n"
					+ "GROUP BY nickname , NICKNAME2 \r\n"
					+ "ORDER BY mytime desc";
			
			try(Connection con=Chat_SSMarketProjectDBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
			{
				try(ResultSet rs=pstmt.executeQuery();)
				{
					while(rs.next())
					{
						userlist.add(new Chat_SSMarketVO(rs.getString("nickname"),rs.getString("nickname2"),rs.getTimestamp("mytime")));
					}
				}
			} 
			catch (SQLException e) 
			{
				e.printStackTrace();
				System.out.println("SQLException");
			}
			catch (Exception e) 
			{
				e.printStackTrace();
				System.out.println("Exception");
			} 
			return userlist;
		}
		
	
		
		
		
		
		
		
		
		
	public static void main(String[] args) 
	{
		Chat_SSMarketProjectDao dao=new Chat_SSMarketProjectDao();

		
		dao.insertChat(new Chat_SSMarketVO("캥거루","코알라","코알라야~"));
		dao.insertChat(new Chat_SSMarketVO("코알라","캥거루","캥거루야~"));
		dao.insertChat(new Chat_SSMarketVO("코알라","캥거루","왜 불러 캥거루야~"));
		dao.insertChat(new Chat_SSMarketVO("캥거루","코알라","왜 불러 코알라야~"));
		dao.deleteChat("캥거루야~");
		
		List<Chat_SSMarketVO> list=dao.getChatListByNickname("장선웅", "김준환");

		for(Chat_SSMarketVO data:list)
		{
			System.out.print(data.getNickname()+"\t");
			System.out.print(data.getNickname2()+"\t");
			System.out.print(data.getMymessage()+"\t");
			System.out.println(data.getMytime());
		}
	}
}
