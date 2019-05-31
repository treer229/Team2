package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import kr.or.bit.dto.Notice;

public class NoticeDao {
	
	DataSource ds;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public NoticeDao() {//DB연결
		try {
			Context context = new InitialContext(); // 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

		} catch (Exception e) {
			System.out.println("NoticeComments" + e.getMessage());
		}
	}
	
	public int writeok(Notice notice) {
		int row=0;
		try {
			conn = ds.getConnection();
			String sql = "insert into NOTICE(NOTICE_NUM, NOTICE_TITLE, CONTENT, VIEWS, CREATED_DATE, ID) values("
					+ "NOTICE_SEQ.nextval,?,?,0,sysdate,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNotice_title());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getId());
			
			System.out.println("---------------------");
			System.out.println(notice.getNotice_title());
			System.out.println(notice.getContent());
			System.out.println(notice.getId());
			System.out.println("---------------------");
			
	        row = pstmt.executeUpdate();
			
		}
			  catch (Exception e) {
			  
			  e.printStackTrace(); }
			 finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return row;
	}


	public List<Notice> list(int cpage, int pagesize) {
		List<Notice> list = null;
		try {
			conn = ds.getConnection();
			String sql = "SELECT * FROM ( "
					+"SELECT ROWNUM rn , NOTICE_NUM , NOTICE_TITLE, CONTENT, VIEWS, CREATED_DATE,ID "
					+"FROM (select * from notice order by notice_num desc) ) "
					+"WHERE rn BETWEEN ? AND ?";
			int start = cpage * pagesize - (pagesize - 1);
			int end = cpage * pagesize;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();
			// 객체 형태로 DB가지고 데이터
			list = new ArrayList<Notice>();
			while (rs.next()) {
				String notice_num = rs.getString("notice_num");
				String notice_title = rs.getString("notice_title");
				String content = rs.getString("content");
				int views = rs.getInt("views");
				String created_date = rs.getString("created_date");
				String id = rs.getString("id");
				
				System.out.println(notice_num+"/"+id+"/"+notice_title+"/"+content+"/"+views+"/"+created_date+"/");
				
				Notice noticedto = new Notice(notice_num,notice_title,content,views,created_date,id);
				list.add(noticedto);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if (rs != null)try {rs.close();} catch (SQLException e) {}
			if (conn != null)try {conn.close();} catch (SQLException e) {}
		}
		return list;
	}

	// 게시물 총 건수 구하기
	public int totalboardCount() {
		int totalcount=0;
		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from NOTICE";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalcount = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if (rs != null)try {rs.close();} catch (SQLException e) {}
			if (conn != null)try {conn.close();} catch (SQLException e) {}
		}
		return totalcount;
	}

	// 게시물 상세 보기(글번호)
	public Notice getContent(String notice_num) throws SQLException {
		try {
			conn = ds.getConnection();
			String sql = "select * from NOTICE where notice_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String notice_title = rs.getString("notice_title");
				String content = rs.getString("content");
				int views = rs.getInt("views");
				String created_date = rs.getString("created_date");
					
				Notice noticedto = new Notice(notice_num,notice_title,content,views,created_date,id);
						
				return noticedto;
			}
			return null;
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if (rs != null)try {rs.close();} catch (SQLException e) {}
			if (conn != null)try {conn.close();} catch (SQLException e) {}
		}
	}

	
	public int deleteOk(String notice_num) throws SQLException {

		try {
			conn = ds.getConnection();
			
			String del_board_sql = "delete from notice where notice_num=?";

					pstmt = conn.prepareStatement(del_board_sql);
					pstmt.setString(1, notice_num);
					int row = pstmt.executeUpdate();
					
					
					if (row > 0) {
						conn.commit(); // 정상처리
					} else {
						conn.rollback();
					}

					return row;
			
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	}

	// 게시물 조회수 증가하기
	public boolean getReadnum(String notice_num) throws SQLException {
		try {
			conn = ds.getConnection();
			String sql = "update NOTICE set views=views+1 where notice_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice_num);
			int row = pstmt.executeUpdate();

			if (row > 0) {
				return true;
			} else {
				return false;
			}

		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	}

	
	
}