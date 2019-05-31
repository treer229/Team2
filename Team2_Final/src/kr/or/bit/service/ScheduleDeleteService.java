package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ScheduleDAO;
import kr.or.bit.dto.Schedule;

public class ScheduleDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String id = request.getParameter("id");
		int schedule_num = Integer.parseInt(request.getParameter("schedule_num"));
		
		ScheduleDAO dao = new ScheduleDAO();
		
		dao.getDeleteSchedule(schedule_num);
		
		List<Schedule> list = dao.getScheduleListAll(id);
		
		request.setAttribute("list", list);
		forward.setPath("/WEB-INF/Page/ScheduleDeleteOk.jsp?id="+id);
		return forward;
	}

}
