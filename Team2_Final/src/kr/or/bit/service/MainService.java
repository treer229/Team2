package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dto.Checklist;

public class MainService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		ChecklistDAO chdao = new ChecklistDAO();
		ActionForward forward = new ActionForward();
		
		List<Checklist> chlist = chdao.getCheckListAll(id);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("chlist", chlist);
		
		forward.setPath("/WEB-INF/Page/Main.jsp");
		return forward;
	}

}
