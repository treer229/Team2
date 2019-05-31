package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ScheduleDAO;
import kr.or.bit.dto.Schedule;

public class ScheduleInsertOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
	String id =	request.getParameter("id");
	String title = request.getParameter("title");
	String start =	request.getParameter("schedule_start");
	String end =	request.getParameter("schedule_end");
		
	System.out.println("스타트 : " + start);
	System.out.println("엔드 : " + end);
		ScheduleDAO dao = new ScheduleDAO();
		Schedule sc = new Schedule();
		
		sc.setId(id);
		sc.setSchedule_title(title);
		sc.setSchedule_start(start);
		sc.setSchedule_end(end);
		
		dao.getInsertSchedule(sc);
		
		request.setAttribute("id", id);
		
		forward.setRedirect(true);
		forward.setPath("insert.Schedule");
		
		return forward;
	}

}
