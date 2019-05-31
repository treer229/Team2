package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.NoticeDao;
import kr.or.bit.dto.Notice;

public class NoticeWriteService implements Action{
	
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		NoticeDao dao = new NoticeDao();
		Notice boarddata = new Notice();


		boarddata.setId(request.getParameter("id"));
		boarddata.setNotice_title(request.getParameter("notice_title"));
		boarddata.setContent(request.getParameter("content"));
		
		int result = dao.writeok(boarddata);
		System.out.println(result+"--------------------------");
		if(result>0) {
			System.out.println("글 입력 성공");
			request.setAttribute("result", "success");
		}
		else {
			System.out.println("글 입력 실패");
			request.setAttribute("result", "fail");
		}
		
		//바로 list 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/notice/noticeWriteOk.jsp");
  
		return forward;
	}

}