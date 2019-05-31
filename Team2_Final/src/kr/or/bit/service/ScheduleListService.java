package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.ScheduleDAO;
import kr.or.bit.dto.Member;
import kr.or.bit.dto.Schedule;

public class ScheduleListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		JSONObject object = new JSONObject();
		JSONArray schedulelist = new JSONArray();
		ScheduleDAO dao = new ScheduleDAO();
        
		String id = request.getParameter("id");

		if(id != null) {
			List<Schedule> list = dao.getScheduleListAll(id);
			for(int i = 0 ; i<list.size(); i++) {
				Schedule sc = list.get(i);
				JSONObject jsonObject = new JSONObject(); 
				jsonObject.put("schedule_title", sc.getSchedule_title());
				jsonObject.put("schedule_start", sc.getSchedule_start());
				jsonObject.put("schedule_end",sc.getSchedule_end());
				
				schedulelist.add(jsonObject);
			}
			object.put("list", schedulelist);
		request.setAttribute("list", object);
		
		System.out.println("제이슨 캘린더 담기 성공");
		}else {
			System.out.println("제이슨 캘린더 담기 실패");
		}
		

		forward.setPath("/WEB-INF/Page/Schedulelisttest.jsp");
		return forward;
	}

}
