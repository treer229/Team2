<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

   <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
  
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
	<%  
        int cpage = (Integer)request.getAttribute("cpage");
        int pagesize = (Integer)request.getAttribute("pagesize");
        int pagecount = (Integer)request.getAttribute("pagecount");
        int totalboardCount = (Integer)request.getAttribute("totalboardCount");
        List<Notice> list = (List)request.getAttribute("list");
    %>
	<c:set var="pagesize" value="<%=pagesize%>" />
	<c:set var="cpage" value="<%=cpage%>" />
	<c:set var="pagecount" value="<%=pagecount%>" />
	<c:set var="list" value="<%=list%>"/>
	<c:set var="totalboardCount" value="<%=totalboardCount%>"/>
	<div id="pagecontainer">
		<div class="card-body">
			<div class="row"></div>
			<div class="row">
			<table class = "table table-bordered dataTable" width="100%" border="1" cellspacing="0" align="center">
				<tr>
					<td colspan="5">
						<div class="row">
						<div class="col-sm-12 col-md-6">
						<form name="list">
						PageSize설정: 
							<select name="ps" onchange="submit()">
		   						<c:forEach var="i" begin="5" end="20" step="5">
		   							<c:choose>
									<c:when test="${pagesize == i}">
	                            		 <option value='${i}' selected>${i}개</option>
	                        		</c:when>
									<c:otherwise>
	                                  	  <option value='${i}'>${i}개</option>
	                               </c:otherwise>
								</c:choose>
		   						</c:forEach>
		   					</select>
						</form>
						
						</div>
						<div class="col-sm-12 col-md-6">
							<c:if test="${sessionScope.id=='admin'}">
								<a href="NoticeWrite.Notice" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style=float:right>글쓰기</a>								
							</c:if>
						</div>
						</div>
						
					</td>
				</tr>
				<tr align="center">
					<th width="10%">순번</th>
					<th width="40%">제목</th>
					<th width="20%">글쓴이</th>
					<th width="20%">날짜</th>
					<th width="10%">조회수</th>
				</tr>
				<!-- 데이터가 한건도 없는 경우  -->
				<%
		     	if(list == null || list.size() == 0){
		     		out.print("<tr><td>데이터가 없습니다</td></tr></table>");
		     		return;
		     	} 
		       %>
		       
				<c:forEach var="board" items="<%=list%>">
					<c:set var="notice_num" value="${board.notice_num }" />
					<c:set var="notice_title" value="${board.notice_title}" />
					<c:set var="id" value="${board.id}" />
					<tr onmouseover="this.style.backgroundColor='gray'"
						onmouseout="this.style.backgroundColor='white'">
						<td align="center">${board.notice_num}</td>
						<td align="center">
							<a href="NoticeRead.Notice?notice_num=${notice_num}&id=${sessionScope.id}">
								${board.notice_title}
							</a>
						</td>
						<td align="center">
							<c:choose>
								<c:when test="${id != null && fn:length(id) > 4}">
                                	${fn:substring(id, 0, 20)}...
                            	</c:when>
								<c:otherwise>
                             	 ${id}
                           		</c:otherwise>
							</c:choose>
						</td>
						<td align="center">${fn:substring(board.created_date,0,10)}</td>
						<td align="center">${board.views}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3" align="center">
						<!--이전 링크 --> 
						<c:if test="${cpage>1}">
							<a href="NoticeList.Notice?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> 
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="NoticeList.Notice?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<!--다음 링크 --> 
						<c:if test="${cpage<pagecount}">
							<a href="NoticeList.Notice?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">총 게시물 수 : <%=totalboardCount %>
					</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	</div>
	
	</div>
    <!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>
</body>
</html>