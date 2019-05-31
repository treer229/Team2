package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.NoticeDao;
import kr.or.bit.dto.Notice;

public class NoticeContentService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String notice_num = request.getParameter("notice_num"); //글번호
		String id = request.getParameter("id");
		System.out.println(notice_num+"/"+id+"------------------");
//		HttpSession session = request.getSession();
		
		
		
		//글번호를 가지고 오지 않았을 경우 예외처리
		if(notice_num==null || notice_num.trim().equals("")){
			response.sendRedirect("noticelist.jsp");
		}
		
		//list 다시 넘어갈때 현재 페이지 * 페이지 사이즈
	    String cpage =	request.getParameter("cp"); //현재 페이지 번호
	    String pagesize =	request.getParameter("ps"); //pagesize 정보
	
	    if(cpage==null || cpage.trim().equals("")){
			cpage="1";
		}
		if(pagesize==null || pagesize.trim().equals("")){
			pagesize="5";
		}
		
		NoticeDao dao = new NoticeDao();
		
		//조회수 증가
		boolean res = dao.getReadnum(notice_num);
		if(res) System.out.println("조회수 증가");
			
		//데이터 조회 출력(글번호가 없는 게시글에 조회시 ...)

		Notice boarddto = dao.getContent(notice_num);//content(Integer.parseInt(idx));
		if(boarddto == null){
			response.sendRedirect("Noticelist.Notice");
		}
		
		ActionForward forward = new ActionForward();
	    request.setAttribute("boarddto", boarddto);
	    request.setAttribute("notice_num", notice_num);
	    request.setAttribute("cpage", cpage);
	    request.setAttribute("pagesize", pagesize);
	    request.setAttribute("id", id);

	    
	    
	    forward.setRedirect(false);
		forward.setPath("/WEB-INF/notice/noticeContent.jsp");
		
		return forward;
	}
}
