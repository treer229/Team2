package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ScheduleDAO;
import kr.or.bit.dto.Schedule;

public class ScheduleDeleteListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		ScheduleDAO dao = new ScheduleDAO();
		
		List<Schedule> list = dao.getScheduleListAll(id);
		System.out.println("리스트 때매");
		request.setAttribute("list", list);
		forward.setPath("/WEB-INF/Page/ScheduleDelete.jsp");
		return forward;
	}

}
