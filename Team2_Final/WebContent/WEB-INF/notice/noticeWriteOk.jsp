<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
   String result = (String)request.getAttribute("result");
   String msg ="";
   String url ="";
   if(result.equals("success")){
	   msg = "Insert success";
	   url = "NoticeList.Notice";
   }else{
	   msg = "Insert fail";
	   url = "NoticeWrite.Notice";
   }
   request.setAttribute("board_msg", msg);
   request.setAttribute("board_url", url);
  
%>
<jsp:forward page="redirect.jsp"></jsp:forward>





