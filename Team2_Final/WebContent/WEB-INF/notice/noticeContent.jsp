<%@page import="com.sun.net.httpserver.HttpsConfigurator"%>
<%@page import="kr.or.bit.dto.Notice"%>
<%@page import="kr.or.bit.dto.TravelReview_Comments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.TravelReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_content</title>
	<%
	Notice boarddto = (Notice)request.getAttribute("boarddto");
	String notice_num = (String)request.getAttribute("notice_num");
	String cpage = (String)request.getAttribute("cpage");
	String pagesize = (String)request.getAttribute("pagesize");
	%>
	
</head>
<body>
	<!-- Page Wrapper -->
  	<div id="wrapper">
  	<!-- Sidebar -->
	<div class="animated fadeInLeft">
	    <jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>
	    </div>
		<!-- End of Sidebar -->
	    <!-- Content Wrapper -->
	    <div id="content-wrapper" class="d-flex flex-column">
	    <!-- Main Content -->
      <div id="content">
	<div class="animated fadeInDown">
	<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>
	</div>
 	<!-- Begin Page Content -->
    <div class="container-fluid">
	<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">공지사항 게시판</h6>
	</div>
	<div id="pagecontainer">
		<div class="card-body" style="padding-top: 30px; text-align: center">
			<center>
				<b>게시판 글내용</b>
				<table class = "table table-bordered dataTable" width="80%" border="1" cellspacing="0" align="center">
					<tr>
						<td width="20%" align="center"><b>작성자</b></td>
						<td width="30%"><%= boarddto.getId() %></td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td><%= boarddto.getCreated_date() %></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>조회수</b></td>
						<td><%= boarddto.getViews()%></td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3"><%= boarddto.getNotice_title()%></td>
					</tr>
					<tr height="100">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
							<%
								String content = boarddto.getContent();
								if(content != null){
									content = content.replace("\n", "<br>");
								}
								out.println(content);
							%>
						
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="NoticeList.Notice?cp=<%= cpage %>&ps=<%= pagesize %>">목록가기</a>
							<c:set var="id" value="<%=boarddto.getId()%>"/>
							<c:if test="${sessionScope.id=='admin'}">
								|<a href="NoticeDeleteCheck.Notice?notice_num=<%=notice_num%>">삭제</a>
							</c:if>
						</td>
					</tr>
				</table>
	<br>
		</center>
		</div>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>
</body>
</html>