package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class MemberCheck implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		
		
		MemberDao dao = new MemberDao();
		String check = dao.MemberCheck(id);
		System.out.println("check" + check);
		request.setAttribute("check", check);
		forward.setPath("/WEB-INF/Page/MemberCheck.jsp");
		return forward;
	}

}
