package kr.or.bit.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.IdSearch;
import kr.or.bit.service.MemberAllList;
import kr.or.bit.service.MemberAllList2;
import kr.or.bit.service.MemberDelete;
import kr.or.bit.service.PasswordSearch;

@WebServlet("*.Member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ActionForward forward=null;
    	Action action = null;
    	//요청받기 시작
    	String requestURI = request.getRequestURI();
    	String ContextPath = request.getContextPath();
    	String url_Command = requestURI.substring(ContextPath.length());

    	System.out.println("requestURI"+requestURI+"컨트롤러 check");
    	System.out.println("ContextPath"+ContextPath+"컨트롤러 check");
    	System.out.println("url_Command"+url_Command+"컨트롤러 check");
    	
    	if(url_Command.equals("/pwdsearch.Member")) {// 업무처리
        	  action = new PasswordSearch();
        	  try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("PasswordSearch 업무 에러");
				e.printStackTrace();
			}
     	}else if(url_Command.equals("/idsearch.Member")) {// 업무처리
      	  action = new IdSearch();
      	  try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("IdSearch 업무 에러");
				e.printStackTrace();
			}
     	}else if(url_Command.equals("/adminsearch.Member")) {
   			action = new MemberAllList2();
   			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("IdSearch 업무 에러");
				e.printStackTrace();
			}
   		
   	    }else if(url_Command.equals("/delete.Member")) {
   			action = new MemberDelete();
   			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				System.out.println("IdSearch 업무 에러");
				e.printStackTrace();
			}
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