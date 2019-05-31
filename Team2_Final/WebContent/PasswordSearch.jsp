<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="password" value="${requestScope.password }"></c:set>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>비밀번호 찾기</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Animation.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/LoginForm.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
  
  function search() {
	  console.log($('#id').val());
	  console.log($('#name').val());
	  $.ajax({
          url:'pwdsearch.Member',
          type:'post',
          data: {id : $('#id').val(), name: $('#name').val()},
          dataType:'text',
          success:function(data){
        	  console.log(data);
          $('.modal-body').html(data);
          }
      })
  }
 			/* document.form1.submit(); */
    		  
  </script>


</head>



<body>

	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0" style="width: 120%">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-5 d-none d-lg-block bg-password-image"></div>
							<div class="col-lg-7">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">비밀번호 찾기</h1>
									</div>
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
			
											id="id" name="id" placeholder="ID를 입력해주세요.">

									</div>

									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="name" name="name" placeholder="이름을 입력해주세요.">
									</div>


									<!-- <input type="button" id="pwsearch" name="pwsearch"
											value="비밀번호찾기" class="btn btn-primary btn-user btn-block"> -->
									<div class="container mt-3">
										<input type="button"
											class="btn btn-primary btn-user btn-block" id="pwsearch"
											name="pwsearch" value="비밀번호찾기" onclick="search()" />


										<!-- 모달처리 -->
										<div class="modal fade" id="myModal">
											<div class="modal-dialog">
												<div class="modal-content">

													<div class="modal-header">
														<h4 class="modal-title">비밀번호</h4>
														<button type="button" class="close" data-dismiss="modal">x</button>
													</div>

													<div class="modal-body">${password.password }</div>

													<div class="modal-footer">
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">닫기</button>
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

			</div>

		</div>

	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="js/sb-admin-2.min.js"></script>


	<script>
$(document).ready(function(){
  $("#pwsearch").click(function(){
    $("#myModal").modal();
  });
});
</script>


</body>

</html>
