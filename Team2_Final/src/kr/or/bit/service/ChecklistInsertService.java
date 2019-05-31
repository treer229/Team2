package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dto.Checklist;

public class ChecklistInsertService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		
		System.out.println(id);
		System.out.println(title);
		ChecklistDAO checkdao = new ChecklistDAO();
		Checklist list = new Checklist();
		
		list.setId(id);
		list.setCl_title(title);
		
		int row = 0;
		
		row = checkdao.getInsertChecklist(list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("read.Checklist?id="+id);
		
		
		return forward;
	}

}
