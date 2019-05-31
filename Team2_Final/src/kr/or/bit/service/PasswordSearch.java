package kr.or.bit.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;

public class PasswordSearch implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
        JSONObject jsonObject = new JSONObject();
		
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("비밀번호찾기");
		
		
		try {
			MemberDao dao = new MemberDao();
			Member member = new Member();
			member = dao.PasswordSearch(id, name);
			
			System.out.println("비밀번호는 "+member.getPassword());
			request.setAttribute("password", member.getPassword());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			
		}
		forward.setRedirect(false);
		forward.setPath("PasswordSearchOk.jsp");
		return forward;
	}

}
