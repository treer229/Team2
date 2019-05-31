<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String tr_num = request.getParameter("tr_num");
	String cpage = request.getParameter("cp");
	String pagesize = request.getParameter("ps");
	String tr_title = request.getParameter("tr_title");
	
	if(tr_num == null || tr_title == null || tr_num.trim().equals("") || tr_title.trim().equals("")){
		response.sendRedirect("travelreviewList.jsp");
		return;
	}
	if(cpage == null || pagesize == null){
		cpage ="1";
		pagesize = "5";
	}
	

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<SCRIPT type="text/javascript">
	function boardcheck() {
		if (!bbs.content.value) {
			alert("글 내용을 입력하세요");
			bbs.content.focus();
			return false;
		}
		document.bbs.submit();
	}
</SCRIPT>
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
		<h6 class="m-0 font-weight-bold text-primary">답글쓰기</h6>
	</div>
    <div id="pagecontainer">
		<div style="padding-top: 25px; text-align: center">
			<form name="bbs" action="TravelReviewRewriteOk.TravelReview" method="POST">
			
				<input type="hidden" name="cp" value="<%= cpage %>" /> 
				<input type="hidden" name="ps" value="<%= pagesize %>" /> 
				<input type="hidden" name="tr_num" value="<%=tr_num%>" /> 
				<input type="hidden" name="userid" value="${sessionScope.id}">
			

				<table class = "table table-bordered dataTable" width="95%" border="2" align="center">
					<tr>
						<td width="20%" align="center">제목</td>
						<td width="80%" align="left">
							<input type="text" name="tr_title" size="40" value="[RE]<%=tr_title%>">
						</td>

					</tr>
					<tr>
						<td width="20%" align="center">글내용</td>
						<td width="80%" align="left">
							<textarea rows="10" cols="60" name="content" class="ckeditor"></textarea></td>

					</tr>
					<tr>
						<td width="20%" align="center">첨부파일</td>
						<td width="80%" align="left">
							<input type="file" name="filename"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
						<input type="button" 	value="완료" onclick="boardcheck();" /> 
						<input type="reset" 	value="다시쓰기" />
						</td>
						
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	</div>
    <!-- /.container-fluid -->
	</div>
	<!-- End of Main Content -->
	<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>
</body>
</html>

