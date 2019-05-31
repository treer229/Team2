package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.NoticeDao;

public class NoticeDeleteService implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String notice_num = request.getParameter("notice_num");
		String msg = "";
		String url ="";
		
		if(notice_num == null || notice_num.trim().equals("")){
			response.sendRedirect("/WEB-INF/notice/noticelist.jsp");
		}
		  
		NoticeDao dao = new NoticeDao();
		int result = dao.deleteOk(notice_num);
		
		if(result>0) {
			System.out.println("글 삭제 성공");
			request.setAttribute("result", "success");
		}
		else {
			System.out.println("글 삭제 실패");
			request.setAttribute("result", "fail");
		}
		request.setAttribute("notice_num", notice_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/notice/noticeDeleteOk.jsp");
  
		return forward;
		
	}

}