package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class IdSearch implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
        JSONObject jsonObject = new JSONObject();
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		System.out.println("아이디찾기");
		
		
		try {
			MemberDao dao = new MemberDao();
			Member member = new Member();
			List<Member> listmember=dao.IdSearch(name, email);
			
			System.out.println("리스트맴버 생성 "+listmember);
			request.setAttribute("listmember", listmember);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		forward.setRedirect(false);
		forward.setPath("IdSearchOk.jsp");
		return forward;
	}

}