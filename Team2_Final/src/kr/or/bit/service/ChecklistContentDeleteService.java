package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dto.Checklist;
import kr.or.bit.dto.Checklistcontent;

public class ChecklistContentDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		int clc_num = Integer.parseInt(request.getParameter("clc_num"));
		int num = Integer.parseInt(request.getParameter("num"));
		ChecklistDAO dao = new ChecklistDAO();
		Checklistcontent content = new Checklistcontent();
		
		Checklist check = dao.getCheckList(num);
		dao.getDeleteChecklistContent(clc_num);
		
		List<Checklistcontent> clc = dao.getChecklistContent(num);
		
		request.setAttribute("content", clc);
		request.setAttribute("title", check);
		request.setAttribute("num", num);
		forward.setPath("/WEB-INF/Page/CheckContentDeleteOk.jsp");
		return forward;
	}

}
