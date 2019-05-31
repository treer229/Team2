<%@page import="kr.or.bit.dao.TravelReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String msg = "";
	String url ="";
	
	
	String result = (String)request.getAttribute("result");
	String tr_num = (String)request.getAttribute("tr_num");

	if(result.equals("success")) {
		msg = "삭제 성공";
		url ="TravelReviewList.TravelReview";
	}
	else{
		msg = "삭제 실패";
		url = "TravelReviewRead.TravelReview?tr_num="+tr_num;
	}
	
	request.setAttribute("board_msg", msg);
	request.setAttribute("board_url", url);
%>
<jsp:forward page="redirect.jsp" />    