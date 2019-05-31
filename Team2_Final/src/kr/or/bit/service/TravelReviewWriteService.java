package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.TravelReviewDao;
import kr.or.bit.dto.TravelReview;

/*
작업일자 : 2019-05-09
작업자 :   이힘찬
작업내용 : TravelReviewWriteService 작성
*/

public class TravelReviewWriteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		TravelReviewDao dao = new TravelReviewDao();
		TravelReview boarddata = new TravelReview();

		boarddata.setId(request.getParameter("id"));
		boarddata.setTr_title(request.getParameter("tr_title"));
		boarddata.setContent(request.getParameter("content"));
		boarddata.setFilename(request.getParameter("file"));
		
		int result = dao.writeok(boarddata);
		
		if(result>0) {
			request.setAttribute("result", "success");
		}
		else {
			request.setAttribute("result", "fail");
		}
		
		//바로 list 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/travelreview/travelreviewWriteOk.jsp");
  
		return forward;
	}

}
