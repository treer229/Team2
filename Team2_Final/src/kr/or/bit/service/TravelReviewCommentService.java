package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.TravelReviewDao;

/*
작업일자 : 2019-05-09s
작업자 :   이힘찬
작업내용 : TravelReviewReplyService 작성
*/

public class TravelReviewCommentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {		
		
		TravelReviewDao dao = new TravelReviewDao();
		
		String id = request.getParameter("id");
		String tr_num = request.getParameter("tr_num");
		String content = request.getParameter("content");
		
		int result = dao.commentwrite(tr_num, id, content);
		
		if(result>0) {
			request.setAttribute("result", "success");
		}
		else {
			request.setAttribute("result", "fail");
		}
		
		request.setAttribute("tr_num",tr_num);
		
		ActionForward forward = new ActionForward();
	    
	    forward.setRedirect(false);
		forward.setPath("/WEB-INF/travelreview/travelreviewReplyOk.jsp");
		
		return forward;
	}

}
