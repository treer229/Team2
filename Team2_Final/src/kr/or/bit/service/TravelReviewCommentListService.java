package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.TravelReviewDao;
import kr.or.bit.dto.TravelReview_Comments;
import net.sf.json.JSONArray;

/*
작업일자 : 2019-05-09
작업자 :   이힘찬
작업내용 : TravelReviewReplyListService 작성
*/

public class TravelReviewCommentListService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String tr_num = request.getParameter("tr_num");
		String ps = request.getParameter("ps");
		String cp = request.getParameter("cp");
		List<TravelReview_Comments> replylist = null;
		
		System.out.println(tr_num+"/"+ps+"/"+cp);
		try {
			TravelReviewDao dao = new TravelReviewDao();
			replylist = dao.commentlist(tr_num);
			
			JSONArray jsonarray = JSONArray.fromObject(replylist);
			
			request.setAttribute("jsonarray", jsonarray);
			
			
		}catch(Exception e) {
			System.out.println("에러");
		}finally {
			
		}
		ActionForward forward = new ActionForward();
		forward.setPath("/WEB-INF/travelreview/replyjson.jsp");
		
		return forward;
	}

}
