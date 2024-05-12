package backendweb.d01_dao;

import java.sql.*;
import java.util.*;

import backendweb.z01_vo.*;

/*
import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class Admin_Dao {

	public Object template(String dname) {
		Object ob = new Object();
		String sql = "select * from dept where dname like ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + dname + "%");
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				rs.next();
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return ob;
	}

	public int templateCUD(String ename) {
		int cudCnt = 0;
		String sql = "INSERT INTO emp01(ename) values(?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, ename);

			cudCnt = pstmt.executeUpdate();
			if (cudCnt == 0) {
				System.out.println("CUD 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("CUD 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return cudCnt;
	}
	
	public List<Member> getMemberList(Member sch){
		List<Member> memberList = new ArrayList<Member>();
		String sql = "SELECT * FROM MEMBERSS WHERE nickname LIKE ?";
			if(sch.getMemno() != 0) sql += " AND memno = ?";
			sql += " order by memno";
		try( 
				  Connection con = DBCon.con();
				  PreparedStatement pstmt = con.prepareStatement(sql);
			){
					// 처리코드1
					pstmt.setString(1, "%"+sch.getNickname()+"%");
					if(sch.getMemno()!=0) 
						pstmt.setInt(2, sch.getMemno());
					
					try( 
							 ResultSet rs = pstmt.executeQuery();
							){
							// 처리코드2
							while(rs.next()) {
								memberList.add(new Member(
												rs.getInt("MEMNO"),
												rs.getString("PHONENUMBER"),
												rs.getString("NICKNAME"),
												rs.getString("PROFILE"),
												rs.getString("LOCATION1"),
												rs.getString("LOCATION2"),
												rs.getInt("AUTH"),
												rs.getString("GRADE")
												));
							}
							System.out.println("건수:"+memberList.size());
						}	
					}catch(SQLException e) {
						System.out.println("DB 에러:"+e.getMessage());
					}catch(Exception e) {
						System.out.println("일반 에러:"+e.getMessage());
					}	
		
		return memberList;
	}
	
	public Member getMember(int memno) {
		Member mem = new Member();
		String sql = "SELECT * FROM MEMBERSS \r\n"
				+ "WHERE MEMNO = ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, memno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				if (rs.next()) {
					mem = new Member(
							rs.getInt("MEMNO"),
							rs.getString("PHONENUMBER"),
							rs.getString("NICKNAME"),
							rs.getString("PROFILE"),
							rs.getString("LOCATION1"),
							rs.getString("LOCATION2"),
							rs.getInt("AUTH"),
							rs.getString("GRADE")
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
	
	public int newAdmin(Member mem) {
		int insCnt = 0;
		String sql="INSERT INTO MEMBERSS VALUES(?,?,?,\r\n"
				+ "'profile.png',?,?,1,'관리자')";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, mem.getMemno());
			pstmt.setString(2, mem.getPhonenumber());
			pstmt.setString(3, mem.getNickname());
//			pstmt.setString(4, mem.getProfile());
			pstmt.setString(4, mem.getLocation1());
			pstmt.setString(5, mem.getLocation2());
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

	public int updateMember(Member upt) {
		int uptCnt = 0;
		String sql = "UPDATE MEMBERSS SET grade=? WHERE memno=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, upt.getGrade());
			pstmt.setInt(2, upt.getMemno());
			uptCnt = pstmt.executeUpdate();
			if (uptCnt == 0) {
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

		return uptCnt;
	}
	
	public int deleteMember(int memno) {
		int delCnt = 0;
		String sql = "DELETE FROM MEMBERSS WHERE memno=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, memno);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return delCnt;
	}
	
	public List<Product> getAllProduct(Product sch) {
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT * FROM PRODUCT ORDER BY writtendate";
		
		try( 
				Connection con = DBCon.con();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			// 처리코드1
			
			try( 
					ResultSet rs = pstmt.executeQuery();
					){
				// 처리코드2
				while(rs.next()) {
					productList.add(new Product(
							rs.getInt("PNO"),
							rs.getString("NICKNAME"),
							rs.getString("PROFILE"),
							rs.getString("CATEGORY"),
							rs.getString("TITLE"),
							rs.getInt("PRICE"),
							rs.getString("PCONTENT"),
							rs.getString("CONDITION"),
							rs.getString("TRANSACTIONLOCATION"),
							rs.getString("TRANSACTIONMETHOD"),
							rs.getString("WRITTENDATE"),
							rs.getString("PRODUCTIMAGE"),
							rs.getInt("PAVAILABLE"),
							rs.getString("location")
							));
				}
				System.out.println("건수:"+productList.size());
			}	
		}catch(SQLException e) {
			System.out.println("DB 에러:"+e.getMessage());
		}catch(Exception e) {
			System.out.println("일반 에러:"+e.getMessage());
		}	
		return productList;
	}
	public List<Product> getProductList(Product sch) {
		List<Product> productList = new ArrayList<Product>();
		String sql = "SELECT * FROM PRODUCT WHERE category LIKE ? AND title LIKE ?";
		if(sch.getPno() != 0) sql += " AND pno=?";
			sql += " ORDER BY pno";
			
		
		try( 
				  Connection con = DBCon.con();
				  PreparedStatement pstmt = con.prepareStatement(sql);
			){
					// 처리코드1
					pstmt.setString(1, "%"+sch.getCategory()+"%");
					pstmt.setString(2, "%"+sch.getTitle()+"%");
					if(sch.getPno()!=0) 
						pstmt.setInt(3, sch.getPno());
					
					try( 
							 ResultSet rs = pstmt.executeQuery();
							){
							// 처리코드2
							while(rs.next()) {
								productList.add(new Product(
												rs.getInt("PNO"),
												rs.getString("NICKNAME"),
												rs.getString("PROFILE"),
												rs.getString("CATEGORY"),
												rs.getString("TITLE"),
												rs.getInt("PRICE"),
												rs.getString("PCONTENT"),
												rs.getString("CONDITION"),
												rs.getString("TRANSACTIONLOCATION"),
												rs.getString("TRANSACTIONMETHOD"),
												rs.getString("WRITTENDATE"),
												rs.getString("PRODUCTIMAGE"),
												rs.getInt("PAVAILABLE"),
												rs.getString("location")
												));
							}
							System.out.println("건수:"+productList.size());
						}	
					}catch(SQLException e) {
						System.out.println("DB 에러:"+e.getMessage());
					}catch(Exception e) {
						System.out.println("일반 에러:"+e.getMessage());
					}	
		return productList;
	}
	
	public Product getProduct(int pno) {
		Product prod = new Product();
		String sql = "SELECT * FROM PRODUCT WHERE PNO = ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, pno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				if (rs.next()) {
					prod = new Product(
							rs.getInt("PNO"),
							rs.getString("NICKNAME"),
							rs.getString("PROFILE"),
							rs.getString("CATEGORY"),
							rs.getString("TITLE"),
							rs.getInt("PRICE"),
							rs.getString("PCONTENT"),
							rs.getString("CONDITION"),
							rs.getString("TRANSACTIONMETHOD"),
							rs.getString("TRANSACTIONLOCATION"),
							rs.getString("WRITTENDATE"),
							rs.getString("PRODUCTIMAGE"),
							rs.getInt("PAVAILABLE"),
							rs.getString("location"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}		
		return prod;
	}
	

	public int deleteProduct(int pno) {
		int delCnt = 0;
		String sql = "DELETE FROM PRODUCT WHERE pno=?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, pno);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return delCnt;
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * PreparedStmtDao dao = new PreparedStmtDao(); int insCnt =
		 * dao.insertProduct(new Product("운동기구", "제목입니다.", 3000, "제발 사주세요", "직거래",
		 * "강남구")); System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		 */
	}

}
