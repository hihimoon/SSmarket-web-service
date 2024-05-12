package backendweb.d01_dao;

import java.sql.*;
import java.util.*;

import backendweb.z01_vo.*;

/*
import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class PreparedStmtDao_sj {
	
	public String schMem(String phonenumber) {
		String pn = "";
		String sql = "SELECT PHONENUMBER FROM MEMBERSS \r\n"
				+ "WHERE PHONENUMBER = ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, phonenumber);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				if (rs.next()) {
					pn=rs.getString("PHONENUMBER");
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}			
		return pn;
	}
	
	public Member login(String phonenumber, String pwd) {
		Member mem = new Member();
		String sql = "SELECT * FROM MEMBERSS \r\n"
				+ "WHERE PHONENUMBER = ? AND PWD = ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, phonenumber);
			pstmt.setString(2, pwd);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				if (rs.next()) {
					mem = new Member(
							rs.getInt("MEMNO"),
							rs.getString("PWD"),
							rs.getString("NICKNAME"),
							rs.getString("PROFILE"),
							rs.getString("LOCATION1"),
							rs.getString("LOCATION2"),
							rs.getInt("AUTH"),
							rs.getString("grade"),
							rs.getString("PHONENUMBER")
							);
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}		
		return mem;
	}
	
	public int newMember(Member mem) {
		int insCnt = 0;
		String sql="INSERT INTO MEMBERSS VALUES(mem_seq.nextval,?,?,\r\n"
				+ "'profile.png', ? , ? ,0,'일반')";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, mem.getPhonenumber());
			pstmt.setString(2, mem.getNickname());
//			//pstmt.setString(4, mem.getProfile());
			pstmt.setString(3, mem.getLocation1());
			pstmt.setString(4, mem.getLocation2());
			
			insCnt = pstmt.executeUpdate();
			if (insCnt == 0) {
				System.out.println("등록 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("등록 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}			
		
		return insCnt;
	}
	
	public int updateMember (Member mem) {
		int upsCnt=0;
		String sql="UPDATE MEMBERSS SET \r\n"
				+ "NICKNAME = ? ,\r\n"
				+ "PROFILE = ? ,\r\n"
				+ "LOCATION1 = ? ,\r\n"
				+ "LOCATION2 = ? \r\n"
				+ "WHERE PHONENUMBER = ? ";
		
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, mem.getNickname());
			pstmt.setString(2, mem.getProfile());
			pstmt.setString(3, mem.getLocation1());
			pstmt.setString(4, mem.getLocation2());
			pstmt.setString(5, mem.getPhonenumber());
			
			upsCnt = pstmt.executeUpdate();
			if (upsCnt == 0) {
				System.out.println("수정 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("수정 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}			
		return upsCnt;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * PreparedStmtDao dao = new PreparedStmtDao(); int insCnt =
		 * dao.insertProduct(new Product("운동기구", "제목입니다.", 3000, "제발 사주세요", "직거래",
		 * "강남구")); System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		 */
		PreparedStmtDao_sj dao = new PreparedStmtDao_sj();
//		dao.newMember(new Member(5,"0104277737","고독도","profile.png","역삼동","고덕동",0,"일반"));
		Member mem = dao.login("01042888679", "1111");
		System.out.println(mem.getNickname());
		System.out.println(mem.getPwd());
		//dao.updateMember(mem);
		//mem = new Member("01042888679","치즈버거냠냠","profile1.jpg","고덕동","하하하");
		//dao.updateMember(mem);
		//dao.updateMember(new Member("치즈버거냠냠","profile1.jpg","고덕동","하하하","01042888679"));
	}

}
