package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.TravelReviewDao;

/*
작업일자 : 2019-05-09
작업자 :   이힘찬
작업내용 : TravelReviewEditOkService 작성
*/

public class TravelReviewEditOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String tr_num = request.getParameter("tr_num");
		
		PrintWriter out = response.getWriter();
		
		if(tr_num == null || tr_num.trim().equals("")){
			out.print("<script>");
			out.print("alert('글번호 오류');");
			out.print("location.href='travelreviewList.jsp'");	   
			out.print("</script>");
		}
		
		TravelReviewDao dao = new TravelReviewDao();
		int result = dao.boardedit(request);
		
		ActionForward forward = new ActionForward();
	    request.setAttribute("result", result);
	    request.setAttribute("tr_num", tr_num);
	    
	    forward.setRedirect(false);
		forward.setPath("/WEB-INF/travelreview/travelreviewEditOk.jsp");
		
		return forward;
	}

}
