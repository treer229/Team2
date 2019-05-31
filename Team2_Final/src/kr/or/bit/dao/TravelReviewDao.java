package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import kr.or.bit.dto.TravelReview_Comments;
import kr.or.bit.dto.Notice_Comments;
import kr.or.bit.dto.TravelReview;

/*
작업일자 : 2019-05-08
작업자 :   이힘찬
작업내용 : TravelReviewDao 작성
*/

public class TravelReviewDao {
	
	DataSource ds;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public TravelReviewDao() {
		try {
			Context context = new InitialContext(); // 이름기반 검색
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

		} catch (Exception e) {
			System.out.println("QnaCommentsDao" + e.getMessage());
		}
	}

	//travelreview insert 함수 (글쓰기)
	public int writeok(TravelReview travelreview) {
		int row=0;
		try {
			conn = ds.getConnection();
			String sql = "insert into travelreview(tr_num,id,tr_title,content,views,created_date,comment_count,filename,refer,depth,step) values("
					+ "TRAVEL_REVIEW_SEQ.nextval,?,?,?,0,sysdate,0,?,?,0,0)";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, travelreview.getId());
			pstmt.setString(2, travelreview.getTr_title());
			pstmt.setString(3, travelreview.getContent());
			pstmt.setString(4, travelreview.getFilename());

			int refer_max = getMaxRefer(conn);
			int refer = refer_max + 1;

			pstmt.setInt(5, refer);

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

	// 글 참조 번호 함수
	public int getMaxRefer(Connection conn) throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int refer_max = 0;
		try {
			String maxRefer_sql = "select nvl(max(refer),0) from travelreview";
			pstmt = conn.prepareStatement(maxRefer_sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				refer_max = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			return refer_max;
		}

	}

	public List<TravelReview> list(int cpage, int pagesize) throws Exception {

		List<TravelReview> list = null;
		try {
			conn = ds.getConnection();
			String sql = " SELECT * FROM "
					+ "( SELECT ROWNUM rn , tr_num , id , tr_title, content,views,created_date,comment_count,"
					+ " filename, filesize, refer , depth , step "
					+ " FROM (	SELECT * FROM travelreview ORDER  BY refer DESC , step ASC  ) "
					+ " ) WHERE rn BETWEEN ? AND ? ";

			int start = cpage * pagesize - (pagesize - 1);
			int end = cpage * pagesize;

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			list = new ArrayList<TravelReview>();
			while (rs.next()) {
				String tr_num = rs.getString("tr_num");
				String id = rs.getString("id");
				String tr_title = rs.getString("tr_title");
				String content = rs.getString("content");
				int views = rs.getInt("views");
				String created_date = rs.getString("created_date");
				int comment_count = rs.getInt("comment_count");
				
				String filename = rs.getString("filename");
				int filesize = rs.getInt("filesize");
				
				int refer = rs.getInt("refer");
				int depth = rs.getInt("depth");
				int step = rs.getInt("step");
				
				TravelReview travelreviewdto = new TravelReview(tr_num,id,tr_title,content,views,created_date,comment_count,filename,filesize,refer,depth,step);
				list.add(travelreviewdto);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pstmt.close();
			rs.close();
			conn.close();
			
			return list;

		}
	}

	// 게시물 총 건수 구하기
	public int totalboardCount() throws SQLException {

		try {
			conn = ds.getConnection();
			String sql = "select count(*) cnt from travelreview";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int totalcount = 0;
			if (rs.next()) {
				totalcount = rs.getInt("cnt");
			}
			return totalcount;
		} /*
			 * catch(Exception e){
			 * 
			 * }
			 */finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}

	}

	// 게시물 상세 보기(글번호)
	public TravelReview getContent(String tr_num) throws SQLException {
		try {
			conn = ds.getConnection();
			String sql = "select * from travelreview where tr_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tr_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				String id = rs.getString("id");
				String tr_title = rs.getString("tr_title");
				String content = rs.getString("content");
				int views = rs.getInt("views");
				String created_date = rs.getString("created_date");
				int comment_count = rs.getInt("comment_count");
					
				String filename = rs.getString("filename");
				int filesize = rs.getInt("filesize");
				
				int refer = rs.getInt("refer");
				int depth = rs.getInt("depth");
				int step = rs.getInt("step");
				

				TravelReview travelreviewdto = new TravelReview(tr_num,id,tr_title,content,views,created_date,comment_count,filename,filesize,refer,depth,step);
						
				return travelreviewdto;
			}
			return null;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	}

	// 답글 쓰기 처리
	public int reWriteOk(TravelReview travelreview) throws SQLException {
		try {
			conn = ds.getConnection();
			
			String tr_num = travelreview.getTr_num(); // 추가
			String id = travelreview.getId();
			String tr_title = travelreview.getTr_title();
			String content = travelreview.getContent();
			String filename = travelreview.getFilename();
			int views = travelreview.getViews();
			String created_date = travelreview.getCreated_date();
			int comment_count = travelreview.getComment_count();
			
			String refer_depth_step_sql = "select refer , depth , step from travelreview where tr_num=?";

			String step_update_sql = "update travelreview set step=step+1 where step > ? and refer=?";

			String rewrite_sql = "insert into travelreview(tr_num,id,tr_title,content,views,created_date,filename,REFER ,DEPTH ,STEP) values("
					+ "TRAVEL_REVIEW_SEQ.nextval,?,?,?,0,sysdate,?,?,?,?)";

			pstmt = conn.prepareStatement(refer_depth_step_sql);
			pstmt.setString(1, tr_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int refer = rs.getInt("refer");
				int step = rs.getInt("step");
				int depth = rs.getInt("depth");
				
				System.out.println("refer : "+refer);
				System.out.println("step : "+step);
				System.out.println("depth : "+depth);
				// step () 값 업데이트

				pstmt = conn.prepareStatement(step_update_sql);
				pstmt.setInt(1, step);
				pstmt.setInt(2, refer);
				pstmt.executeUpdate();

				pstmt = conn.prepareStatement(rewrite_sql);
				pstmt.setString(1, id);
				pstmt.setString(2, tr_title);
				pstmt.setString(3, content);
				pstmt.setString(4, filename);
				
				pstmt.setInt(5, refer);
				pstmt.setInt(6, depth + 1);
				pstmt.setInt(7, step + 1);

				int row = pstmt.executeUpdate();
				return row;
			} else {
				return -1;
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

	public int deleteOk(String tr_num, String id) throws SQLException {

		try {
			conn = ds.getConnection();
			// ID 검증
			String sel_pwd_sql = "select id from travelreview where tr_num=?";
			// 덧글 삭제 (참조 제약 관계)
			String del_reply_sql = "delete from travelreview_comments where tr_num=?";
			// 게시글 삭제
			String del_board_sql = "delete from travelreview where tr_num=?";

			pstmt = conn.prepareStatement(sel_pwd_sql);
			pstmt.setString(1, tr_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbid = rs.getString("id");
				if (id.equals(dbid)) {
					conn.setAutoCommit(false); // ... rollback , commit 처리 강제
					// 덧글 삭제
					pstmt = conn.prepareStatement(del_reply_sql);
					pstmt.setString(1, tr_num);
					pstmt.executeUpdate();
					// 게시글 삭제
					pstmt = conn.prepareStatement(del_board_sql);
					pstmt.setString(1, tr_num);
					int row = pstmt.executeUpdate();
					
					System.out.println("권순조");
					
					if (row > 0) {
						conn.commit(); // 정상처리
					} else {
						conn.rollback();
					}

					return row;
				} else {
					return 0;
				}
			} else {
				return -1;
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

	// 게시물 편집하기 상세보기(글번호)
	public TravelReview getEditContent(String tr_num) throws SQLException {
		return this.getContent(tr_num);
	}

	// 게시글 수정하기
	public int boardedit(HttpServletRequest travelreview) throws SQLException {
		try {
			
			// 사용자 수정값 받아오기
			String tr_num = travelreview.getParameter("tr_num");
			String id = travelreview.getParameter("id");
			String tr_title = travelreview.getParameter("tr_title");
			String content = travelreview.getParameter("content");
			String filename = travelreview.getParameter("filename");

			conn = ds.getConnection();
			String select_idx_sql = "select tr_num from travelreview where tr_num=? and id=?";
			String update_board_sql = "update travelreview set tr_title=?,content=?,filename=? where tr_num=?";
					
			pstmt = conn.prepareStatement(select_idx_sql);
			pstmt.setString(1, tr_num);
			pstmt.setString(2, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				pstmt = conn.prepareStatement(update_board_sql);
				pstmt.setString(1, tr_title);
				pstmt.setString(2, content);
				pstmt.setString(3, filename);
				pstmt.setString(4, tr_num);

				int row = pstmt.executeUpdate();
				return row;
			}
			return -1;
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}

	}

	// 게시물 조회수 증가하기
	public boolean getReadnum(String tr_num) throws SQLException {
		try {
			conn = ds.getConnection();
			String sql = "update travelreview set views=views+1 where tr_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tr_num);
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

	//덧글 입력하기
	public int commentwrite(String tr_num, String id, String content) throws SQLException {
		int row = 0;
		try {
			conn = ds.getConnection();
			String sql = "insert into TravelReview_Comments(tr_num,comment_num,id,content,created_date) values ("
					+ " ?,travel_review_comments_seq.nextval,? ,? ,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, tr_num);
			pstmt.setString(2, id);
			pstmt.setString(3, content);

			row = pstmt.executeUpdate();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close(); // pool conn 객체반환
		}
		return row;
	}
	
	//덧글 리스트
	public List<TravelReview_Comments> commentlist(String tr_num) {
		List<TravelReview_Comments> trcommentlist = new ArrayList<TravelReview_Comments>();
		
		try {
			conn = ds.getConnection();
			String reply_sql = "select * from TravelReview_Comments where tr_num=? order by comment_num desc";

			pstmt = conn.prepareStatement(reply_sql);
			pstmt.setString(1, tr_num);

			rs = pstmt.executeQuery();

			ArrayList<TravelReview_Comments> list = new ArrayList<TravelReview_Comments>();
			while (rs.next()) {
				String id = rs.getString("ID");
				String content = rs.getString("CONTENT");
				String create_date = rs.getString("CREATED_DATE");
				String comment_num = rs.getString("comment_num");
				
				TravelReview_Comments trcomments = new TravelReview_Comments();
				trcomments.setId(id);
				trcomments.setContent(content);
				trcomments.setComment_date(create_date);
				trcomments.setComment_num(comment_num);
				trcommentlist.add(trcomments);
			}
		} catch (Exception e) {
			e.getStackTrace();
		} 
		finally {
			if (rs != null) try {rs.close();} catch (Exception e) {}
			if (pstmt != null) try {pstmt.close();} catch (Exception e) {}
			if (conn != null) try {conn.close();} catch (Exception e) {}
		}
		return trcommentlist;
	}

	// 덧글 삭제하기
	public int commentDelete(String comment_num, String id) throws SQLException {
		try {
			String commentselect = "select id from travelreview_comments where comment_num=?";
			
			String commentdelete = "delete from travelreview_comments where comment_num=?";

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(commentselect);
			pstmt.setString(1, comment_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
					String dbid = rs.getString("id");
					System.out.println(dbid+"-------------------------------");
					System.out.println(id+"-------------------------");
					if (id.equals(dbid)) {
							System.out.println("여기로 온다고 ?");
							// 실제 삭제 처리
							pstmt = conn.prepareStatement(commentdelete);
							pstmt.setString(1, comment_num);
							int row = pstmt.executeUpdate();
							
							return row;
						} else {
							return 0;
						}
					} else {
						return -1;
					} 
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	}
	
}
