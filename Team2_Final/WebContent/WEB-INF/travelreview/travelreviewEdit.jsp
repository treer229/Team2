<%@page import="kr.or.bit.dto.TravelReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String tr_num = (String) request.getAttribute("tr_num");
	TravelReview boarddata = (TravelReview) request.getAttribute("boarddata");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	function editCheck() {
		if (!edit.tr_title.value) {
			alert("제목을 입력하세요");
			edit.tr_title.focus();
			return false;
		}

		if (!edit.content.value) {
			alert("글 내용을 입력하세요");
			edit.content.focus();
			return false;
		}

		document.edit.submit();

	}
</script>
</head>
<body>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>

		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
					<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>	
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">여행후기 게시판</h6>
						</div>
						<div id="pagecontainer">
							<div style="padding-top: 25px; text-align: center">
								<form name="edit" action="TravelReviewEdit.TravelReview"
									method="POST">
									<input type="hidden" name="id" value="${sessionScope.id }">
									<input type="hidden" name="tr_num"
										value="<%=boarddata.getTr_num()%>">
									<center>
										<table width="90%" border="1">
                                            <tr>
                                                <td width="30%"> 작성자 : <%=boarddata.getId()%></td>
                                                
                                            </tr>
                                            <tr>
                                            <td>작성일  : <%=boarddata.getCreated_date()%></td>
                                            </tr>
										<tr>
											<td width="80%" align="left">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
												name="tr_title" value="<%=boarddata.getTr_title()%>" size="60"></td>
											</tr>
										<tr>
											<td width="80%" align="left">기본 쓰기<br><textarea rows="10"
													cols="60" name="content" class="ckeditor">
									<%=boarddata.getContent()%>
								</textarea></td>
											</tr>
											<tr>
												<td colspan="4" align="center"><input type="button"
													value="수정하기" class = "btn btn-success" onclick="editCheck();"> 
												</td>
											</tr>
										</table>
									</center>
								</form>
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