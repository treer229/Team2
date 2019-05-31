package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dto.Checklist;

public class Checklistservice implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String color = request.getParameter("color");
		
		System.out.println(id);
		System.out.println(title);
		System.out.println(color);
		ChecklistDAO checkdao = new ChecklistDAO();
		Checklist list = new Checklist();
		
		list.setId(id);
		list.setCl_title(title);
		list.setColor(color);
		
		checkdao.getInsertChecklist(list);
		ActionForward forward = new ActionForward();
		forward.setPath("/WEB-INF/Page/test.jsp");
		
		return forward;
	}

}
