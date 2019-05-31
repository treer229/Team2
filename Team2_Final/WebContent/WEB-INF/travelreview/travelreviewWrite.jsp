<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script type="text/javascript" src="ckeditor/ckeditor.js"></script>

<SCRIPT type="text/javascript">
	function check() {
		if (!bbs.tr_title.value) {
			alert("제목을 입력하세요");
			bbs.tr_title.focus();
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
							<h6 class="m-0 font-weight-bold text-primary">여행후기 게시판 글쓰기</h6>
						</div>
						<div id="pagecontainer">
							<div style="padding-top: 25px; text-align: center">
								<!-- form 시작 ---------->
								<form name="bbs" action="TravelReviewWriteOk.TravelReview"
									method="POST">
									<input type="hidden" name="id" value="${sessionScope.id }">
									<table class="table table-bordered dataTable" width="95%"
										border="2" align="center">
										<tr>
											<td width="80%" align="left">제목&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
												name="tr_title" size="60"></td>
										</tr> 
										<tr>
											<td width="80%" align="left">기본 쓰기<br><textarea rows="10"
													cols="60" name="content" class="ckeditor"></textarea></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="button"
												value="글쓰기" class = "btn btn-success" onclick="check();" />
										</tr> 
									</table>
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