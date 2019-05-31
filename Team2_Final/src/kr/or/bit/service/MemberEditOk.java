package kr.or.bit.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.MemberDao;
import kr.or.bit.dto.Member;


public class MemberEditOk implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = null;
		String id = request.getParameter("id");
		System.out.println(id +" 정보수정");
		
		 System.out.println("경로" + request.getContextPath());
	        String filename = "";
	        try {
	            String uploadpath = request.getRealPath("img");
	            System.out.println("실배포경로 : " + uploadpath);
	            String root = uploadpath + "/Memberimg/";
				Part part = request.getPart("upload");
		        System.out.println("파일 업로드 접근전");
		        if(part.getHeader("Content-Disposition").contains("filename=")) {
		        	System.out.println("disposition 접근");
		        	filename = part.getSubmittedFileName();
		        	System.out.println("filename 받아왔다." + filename);
		        	if(part.getSize() > 0) {
		        		System.out.println("파일 가져와서 사이즈 측정");
		        		part.write(root +"/"+ filename);
		        		part.delete();
		        	}
		        }
	        } catch (IOException | ServletException e1) {
				System.out.println("e1에러" +  e1.getMessage());
			}
		
		PrintWriter out = null;
		Member member = null;
		int row = 0;
		try {
		MemberDao dao = new MemberDao();
		member = new Member();
		out = response.getWriter();	
		
		member.setId(id);
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setGender(Integer.parseInt(request.getParameter("gender")));
		member.setEmail(request.getParameter("email"));
		member.setTravel(request.getParameter("travel"));
		if(filename == "") {
			filename = "default.jpg";
		}
		member.setFilepath(("img/Memberimg/"+filename).trim());
		row=dao.MemberEdit(member);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("Member", member);
		forward = new ActionForward();
		forward.setPath("/Main.do");
		return forward;
	}

}
