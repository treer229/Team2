package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ScheduleDAO;
import kr.or.bit.dto.Schedule;

public class ScheduleEditOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String id =	request.getParameter("id");
		String title = request.getParameter("title");
		String start =	request.getParameter("start");
		String end =	request.getParameter("end");
		
		
		ScheduleDAO dao = new ScheduleDAO();
		Schedule sc = new Schedule();
		
		sc.setSchedule_num(num);
		sc.setId(id);
		sc.setSchedule_title(title);
		sc.setSchedule_start(start);
		sc.setSchedule_end(end);
		
		dao.getUpdeateSchedule(sc);
		
		forward.setPath("DeleteSchedule.Schedule?id="+id);
		return forward;
	}

}
