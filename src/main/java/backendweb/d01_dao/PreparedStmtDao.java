package backendweb.d01_dao;

import java.sql.*;
import java.util.*;

import backendweb.z01_vo.*;

/*
import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class PreparedStmtDao {

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
	    String sql = "INSERT INTO PRODUCT (pno, nickname, CATEGORY, TITLE, price, PCONTENT, CONDITION, TRANSACTIONMETHOD, TRANSACTIONLOCATION,WRITTENDATE, PAVAILABLE) VALUES(product_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
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

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * PreparedStmtDao dao = new PreparedStmtDao(); int insCnt =
		 * dao.insertProduct(new Product("운동기구", "제목입니다.", 3000, "제발 사주세요", "직거래",
		 * "강남구")); System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		 */
	}

}
