﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="message" class="kr.or.bit.dto.TravelReview">
	<jsp:setProperty property="*" name="message"/>	
</jsp:useBean>
<%
	out.print(message.getId() + "<br>");
	out.print(message.getId() + "<br>");
	/* 
	데이터 검증용 코드
	
	out.print(message.getWriter() + "<br>");
	out.print(message.getEmail() + "<br>");
	out.print(message.getHomepage() + "<br>");
	out.print(message.getContent() + "<br>");
	out.print(message.getPwd() + "<br>");
	out.print(message.getFilename() + "<br>");
   */
   //서비스 요청 (게시글 insert 서비스)
/*    boardservice service = boardservice.getInstance();
   int result = service.writeOK(message); */
   String result = (String)request.getAttribute("result");
   String msg ="";
   String url ="";
   if(result.equals("success")){
	   msg = "게시물 등록 완료";
	   url = "TravelReviewList.TravelReview";
   }else{
	   msg = "게시물 등록 실패";
	   url = "TravelReviewWrite.TravelReview";
   }
   request.setAttribute("board_msg", msg);
   request.setAttribute("board_url", url);
  
%>
<jsp:forward page="redirect.jsp"></jsp:forward>





