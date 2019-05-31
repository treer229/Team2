package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.TravelReviewDao;

/*
작업일자 : 2019-05-09
작업자 :   이힘찬
작업내용 : TravelReviewDeleteService 작성
*/

public class TravelReviewDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String tr_num = request.getParameter("tr_num");
		String id = request.getParameter("id");
		String msg = "";
		String url ="";
		
		if(tr_num == null || tr_num.trim().equals("")){
			response.sendRedirect("/WEB-INF/travelreview/travelreviewList.jsp");
		}
		  
		TravelReviewDao dao = new TravelReviewDao();
		int result = dao.deleteOk(tr_num,id);
		
		if(result>0) {
			System.out.println("글 삭제 성공");
			request.setAttribute("result", "success");
		}
		else {
			System.out.println("글 삭제 실패");
			request.setAttribute("result", "fail");
		}
		request.setAttribute("tr_num", tr_num);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/travelreview/travelreviewDeleteOk.jsp");
  
		return forward;
		
	}
}
