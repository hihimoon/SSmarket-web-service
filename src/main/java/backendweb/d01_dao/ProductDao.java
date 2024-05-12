package backendweb.d01_dao;

import java.sql.*;
import java.util.*;

import backendweb.z01_vo.*;

/*
import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class ProductDao {

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

	public int insertProduct(Product ins) {
		int isInsert = 0;
		String sql = "INSERT INTO PRODUCT (pno, nickname, CATEGORY, TITLE, price, PCONTENT, CONDITION, TRANSACTIONMETHOD, TRANSACTIONLOCATION,WRITTENDATE, PAVAILABLE, location) VALUES(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?,?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);

			pstmt.setString(2, ins.getCategory());
			pstmt.setString(1, ins.getNickname());
			pstmt.setString(3, ins.getTitle());
			pstmt.setInt(4, ins.getPrice());
			pstmt.setString(5, ins.getPcontent());
			pstmt.setString(6, ins.getCondition());
			pstmt.setString(7, ins.getTransactionmethod());
			pstmt.setString(8, ins.getTransactionlocation());
			/* pstmt.setString(8, ins.getProductimage()); */
			pstmt.setInt(9, 1);
			pstmt.setString(10, ins.getLocation());

			isInsert = pstmt.executeUpdate();

			if (isInsert == 0) {
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

		return isInsert;
	}

	/*
	 * public List<Product> getProductList(Product sch) { List<Product> productList
	 * = new ArrayList<Product>(); String sql =
	 * "SELECT * FROM product order by writtendate"; // 기본값 0인경우 전체 검색이 필요하기에 0면
	 * 검색조건에서 제외 // sql 문과 pstmt에 처리..
	 * 
	 * 
	 * if (sch.getDeptno() != 0) sql += "AND deptno = ?"; sql += " order by empno";
	 * 
	 * 
	 * try (Connection con = DBCon.con(); PreparedStatement pstmt =
	 * con.prepareStatement(sql);
	 * 
	 * ) {
	 * 
	 * 
	 * pstmt.setString(1, "%" + sch.getEname() + "%"); pstmt.setString(2, "%" +
	 * sch.getJob() + "%"); if (sch.getDeptno() != 0) pstmt.setInt(3,
	 * sch.getDeptno());
	 * 
	 * 
	 * try (ResultSet rs = pstmt.executeQuery()) { while (rs.next()) {
	 * productList.add(new Product(rs.getInt("pno"), rs.getString("nickname"),
	 * rs.getString("profile"), rs.getString("category"), rs.getString("title"),
	 * rs.getInt("price"), rs.getString("pcontent"),
	 * rs.getString("transactionmethod"), rs.getString("transactionlocation"),
	 * rs.getString("writtendate"), rs.getString("productimage"),
	 * rs.getInt("pavailable"))); } System.out.println("데이터 건수:" +
	 * productList.size()); } } catch (SQLException e) {
	 * 
	 * } catch (Exception e) {
	 * 
	 * }
	 * 
	 * return productList;
	 * 
	 * }
	 */

	public Product getProduct(int pno) {
		Product prod = null;
		String sql = "SELECT * \r\n" + "FROM product\r\n" + "WHERE pno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, pno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno name id pwd auth point
				if (rs.next()) {
					prod = new Product(rs.getInt("pno"), rs.getString("nickname"), rs.getString("profile"),
							rs.getString("category"), rs.getString("title"), rs.getInt("price"),
							rs.getString("pcontent"), rs.getString("condition"), rs.getString("transactionmethod"),
							rs.getString("transactionlocation"), rs.getString("writtendate"),
							rs.getString("productimage"), rs.getInt("pavailable"),rs.getString("location"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return prod;
	}

	public List<Product> getProductListBySearch(Product sch) {
		List<Product> pList = new ArrayList<Product>();
		String sql = "SELECT *\r\n" + "FROM product\r\n" + "WHERE category LIKE ?\r\n"
				+ "AND title LIKE ?  order by writtendate";
		
		
		
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + sch.getCategory() + "%");
			pstmt.setString(2, "%" + sch.getTitle() + "%");
			/* pstmt.setString(3, "%" + sch.getLocation() + "%"); */
	

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				while (rs.next()) {
//				
					pList.add(new Product(rs.getInt("pno"), rs.getString("nickname"), rs.getString("profile"),
							rs.getString("category"), rs.getString("title"), rs.getInt("price"),
							rs.getString("pcontent"), rs.getString("condition"), rs.getString("transactionmethod"),
							rs.getString("transactionlocation"), rs.getString("writtendate"),
							rs.getString("productimage"), rs.getInt("pavailable"),rs.getString("location")));
				}
				System.out.println("건수:" + pList.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return pList;
	}

	public List<Product> getProductListByNickname(String nick) {
		List<Product> pList = new ArrayList<Product>();
		String sql = "SELECT *\r\n" + "FROM product\r\n" + "WHERE NICKNAME = ?";

		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, nick);

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				while (rs.next()) {
					pList.add(new Product(rs.getInt("pno"), rs.getString("nickname"), rs.getString("profile"),
							rs.getString("category"), rs.getString("title"), rs.getInt("price"),
							rs.getString("pcontent"), rs.getString("transactionmethod"),
							rs.getString("transactionlocation"), rs.getString("writtendate"),
							rs.getString("productimage"), rs.getInt("pavailable")));
				}
				System.out.println("건수:" + pList.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return pList;
	}

	public int cntProductListByNickname(String nick) {
		int cntInt = 0;
		String sql = "SELECT count(pno) cnt FROM PRODUCT\r\n"
				+ "WHERE NICKNAME = ?";

		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, nick);

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				rs.next();
				cntInt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return cntInt;
	}	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * PreparedStmtDao dao = new PreparedStmtDao(); int insCnt =
		 * dao.insertProduct(new Product("운동기구", "제목입니다.", 3000, "제발 사주세요", "직거래",
		 * "강남구")); System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		 */
//		ProductDao dao = new ProductDao();
//		System.out.println(dao.cntProductListByNickname("치즈버거냠냠"));
	}

}
