<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>여행이 좋다.</title>

</head>

<body id="page-top">
	<div id="wrapper">
		<div class="animated fadeInLeft">
			<jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>
		</div>

		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<div class="animated fadeInDown">
					<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>
				</div>
				<div class="container-fluid">
					<div class="row">
						<jsp:include page="/WEB-INF/Common/weather.jsp"></jsp:include>
						<jsp:include page="/WEB-INF/Common/exchange.jsp"></jsp:include>
						<div class="row">
							<div class="col-xl-4 col-lg-5">
								<div class="card shadow mb-4">
									<div
										class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
										<h6 class="m-0 font-weight-bold text-primary">최근 체크리스트</h6>
									</div>
									<div class="card-body">
										<div>
											<c:forEach var="i" items="${chlist}" end="4">
												<a href="CheckContent.Checklist?num=${i.cl_num }">${i.cl_title }</a>
												<hr>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>

</body>

</html>
