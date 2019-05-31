package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Checklist;
import kr.or.bit.dto.Member;

public class LoginOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		//실험
		ChecklistDAO chdao = new ChecklistDAO();
		List<Checklist> chlist = chdao.getCheckListAll(id);
		
		//실험끝
		MemberDao dao = new MemberDao();
		
		Member member = dao.MemberSearch(id);
		System.out.println("id : " + id );
		System.out.println("pwd : " + pwd);
		ActionForward forward = new ActionForward();
		if(member != null) {
			if(member.getPassword().equals(pwd)) {
				HttpSession session = request.getSession();
				
				session.setAttribute("id", id);
				session.setAttribute("chlist", chlist);
				session.setAttribute("Member", member);
				forward.setPath("/WEB-INF/Page/Main.jsp");
			}else {
				forward.setRedirect(true);
				forward.setPath("Index.jsp");
			}
			return forward;
		}else {
			forward.setRedirect(true);
			forward.setPath("Index.jsp");
		}
		
		return forward;
		
	}

}
