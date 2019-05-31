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
import kr.or.bit.service.NoticeContentService;
import kr.or.bit.service.NoticeDeleteService;
import kr.or.bit.service.NoticeListService;
import kr.or.bit.service.NoticeWriteService;


@WebServlet("*.Notice")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public NoticeController() {
        super();
        
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String cmdURI = requestURI.substring(contextPath.length());
        
        
        ActionForward forward = new ActionForward();
        Action action = null;
    	
    	
    	// 글 작성 화면 요청이 들어왔을때, ok  (화면처리)
        if(cmdURI.equals("/NoticeWrite.Notice")){
        	forward.setRedirect(false);
        	forward.setPath("/WEB-INF/notice/noticeWrite.jsp");
        }
        
        // 글 리스트 보여주기, ok
        else if(cmdURI.equals("/NoticeList.Notice")){
        	action = new NoticeListService();
        	
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        // 글 상세보기, ok
        else if(cmdURI.equals("/NoticeRead.Notice")){
        	action = new NoticeContentService();
        	System.out.println("read");
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        // 글 작성 요청, ok
        else if(cmdURI.equals("/NoticeWriteOk.Notice")){
        	action = new NoticeWriteService();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        // 글 삭제 비밀번호 확인 처리, ok
        else if(cmdURI.equals("/NoticeDeleteCheck.Notice")){
        	action = new NoticeDeleteService();
        	try {
				forward = action.execute(request, response);
			} 
        	catch (Exception e) {
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
