package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.LoginOkService;
import kr.or.bit.service.LogoutService;
import kr.or.bit.service.MemberCheck;
import kr.or.bit.service.MemberEdit;
import kr.or.bit.service.MemberEditOk;
import kr.or.bit.service.MemberInsert;

/**
 * Servlet implementation class MemberController
 */
@MultipartConfig(
		location = "C:\\Users\\Public\\Pictures\\Sample Pictures",
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold = -1
		
		)

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ActionForward forward = new ActionForward();
    	Action action = null;
    	
    	//요청받기 시작
    	String requestURI = request.getRequestURI();
    	String ContextPath = request.getContextPath();
    	String url_Command = requestURI.substring(ContextPath.length());

    	System.out.println("requestURI"+requestURI+"컨트롤러 check");
    	System.out.println("ContextPath"+ContextPath+"컨트롤러 check");
    	System.out.println("url_Command"+url_Command+"컨트롤러 check");
    	
    	
    	if(url_Command.equals("/Loginok.do")) {// 업무처리
    		action = new LoginOkService();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("로그인업무 실패");
				e.printStackTrace();
			}
    		
    	}else if(url_Command.equals("/SighUp.do")) {
    		forward = new ActionForward();
    		forward.setPath("/WEB-INF/Page/sighup.jsp");
    	}else if(url_Command.equals("/SighUpok.do")) {
    		action = new MemberInsert();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("회원가입 업무 실패");
				e.printStackTrace();
			}
    	}else if(url_Command.equals("/checked.do")) {
    		action = new MemberCheck();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("체크 업무 실패");
				e.printStackTrace();
			}
    		
    	}else if(url_Command.equals("/MemberEdit.do")) {
    		forward = new ActionForward();
    		forward.setPath("/WEB-INF/Page/MemberEdit.jsp");
    	}else if(url_Command.equals("/Editok.do")){
    		action = new MemberEditOk();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("정보수정 업무 실패");
				e.printStackTrace();
			}
    		
    	}else if(url_Command.equals("/Charts.do")) {
    		forward = new ActionForward();
    		forward.setPath("/WEB-INF/Page/Charts.jsp");
    	}else if(url_Command.equals("/logout.do")){
    		action = new LogoutService();
    		try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("로그아웃 업무 실패");
				e.printStackTrace();
			}
    	}else if(url_Command.equals("/Main.do")) {
       		forward = new ActionForward();
    		forward.setPath("/WEB-INF/Page/Main.jsp");
    	} 
    	
    	
    	if(forward != null){
			if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath());
			}else{
			   RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
			   dispatcher.forward(request, response);
		   }
		}
    }
		

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}

