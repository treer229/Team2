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
작업내용 : TravelReviewContentService 작성
*/

public class TravelReviewContentService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String tr_num = request.getParameter("tr_num"); //글번호
		String id = request.getParameter("id");
				
		if(tr_num==null || tr_num.trim().equals("")){
			response.sendRedirect("travelreviewlist.jsp");
		}
		
	    String cpage =	request.getParameter("cp"); //현재 페이지 번호
	    String pagesize =	request.getParameter("ps"); //pagesize 정보
	
	    if(cpage==null || cpage.trim().equals("")){
			cpage="1";
		}
		if(pagesize==null || pagesize.trim().equals("")){
			pagesize="5";
		}
		
		TravelReviewDao dao = new TravelReviewDao();
		
		boolean res = dao.getReadnum(tr_num);
		if(res) System.out.println("조회수 증가");
			
		TravelReview boarddto = dao.getContent(tr_num);
		if(boarddto == null){
			response.sendRedirect("TravelReviewList.TravelReview");
		}
		
		ActionForward forward = new ActionForward();
	    request.setAttribute("boarddto", boarddto);
	    request.setAttribute("tr_num", tr_num);
	    request.setAttribute("cpage", cpage);
	    request.setAttribute("pagesize", pagesize);
	    request.setAttribute("dao", dao);
	    request.setAttribute("id", id);
	    
	    
	    forward.setRedirect(false);
		forward.setPath("/WEB-INF/travelreview/travelreviewContent.jsp");
		
		return forward;
	}
}
