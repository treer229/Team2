package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ChecklistDAO;
import kr.or.bit.dto.Checklist;

public class ChecklistDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		int cl_num = (Integer.parseInt(request.getParameter("cl_num")));
		System.out.println("id값 "+id);
		
		ChecklistDAO dao = new ChecklistDAO();
		
		dao.getDeleteChackList(cl_num);
		
		List<Checklist> list = dao.getCheckListAll(id); //아이디값 받아오기
		request.setAttribute("list", list);
		forward.setPath("/WEB-INF/Page/ChecklistDelete.jsp?id="+id);
		
		
		return forward;
	}

}
