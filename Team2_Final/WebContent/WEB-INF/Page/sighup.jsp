<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="css/LoginForm.css">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var check = 1;
		$(document).ready(function(){
			
			//id = "message 클릭 $.ajax 사용해서"
			
			$('#checked').click(function(){
				if($('#id').val() == ""){
					alert('공백은 불가능 합니다.');
					$('#id').focus();
					return
				}
				var id = $('#id').val();
				console.log("아이디 : "+id);
			$.ajax({
				url : "checked.do",
				data : {id:id},
				dataType : "html",
				Type : "get",
				
				success : function(data){
					console.log(data.trim());
					if(data.trim() === 'true'){
						alert('사용 불가[중복]');
						check = 1;
					}else{
						alert('사용 가능');
						check = 0;
						$('#id').attr("readonly", "readonly");
					}
				},
				error : function(xhr){
					alert("에러 발생 : " + xhr.status);
				}
			});
		});	
			
			//유효성 검사
			$("#sigh").click(function(){
		         if($("#id").val()==""){
		             alert("ID를 입력해주세요.");
		             $("#id").focus();
		             return false;
		         }else if($("#password").val() ==""){
		             alert("비밀번호를 입력해주세요.");
		             $("#password").focus();
		             return false;
			     }else if($("#name").val() ==""){
		             alert("이름을 입력해주세요.");
		             $("#name").focus();
		             return false;
			     }else if($("#travel").val() ==""){
		             alert("관심지역을 입력해주세요.");
		             $("#travel").focus();
		             return false;
			     }else if($("#email").val() ==""){
		             alert("이메일을 입력해주세요.");
		             $("#email").focus();
		             return false;
			     }else if(check == 1){
			    	 alert("ID 중복확인을 해주세요.")
			    	 return false;
			     }else{
					alert('회원가입 하신걸 진심으로 축하드립니다^^!')
		             $('#sighok').submit();
		         } 
		     });
		});
	</script>
<title>여행이 좋다,</title>

<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0" style = "width: 125% ">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image" style = "width :1000px"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원 가입</h1>
							</div>
							<form class="user" action="SighUpok.do" method="post" id="sighok"
								name="sighok">
								<div>
									<div class="form-group" style="width: 70%; float: left">
										<input type="text" class="form-control form-control-user"
											id="id" name="id" placeholder="ID를 입력해주세요." maxlength="15">
									</div>
									<input type="button" id="checked" name="checked" value="중복 확인"
										class="login pull-right"
										style="border-radius: 5px; height: calc(1.5em + 1.55rem + 2px)">
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										id="password" name="password" placeholder="비밀번호를 입력해주세요.">
								</div>
								<div class="form-group" style="width: 70%; float: left">
									<input type="text" class="form-control form-control-user"
										id="name" name="name" placeholder="이름을 입력해주세요.">
								</div>
								<div style="float: right">
									<label class="btn btn-primary"> <span class="ico">
											<input type="radio" name="gender" id="gender" value="1"
											checked>남
									</span>
									</label> <label class="btn btn-secondary"> <span class="ico">
											<input type="radio" name="gender" id="gender" value="0">여
									</span>

									</label>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="travel" name="travel" placeholder="관심 지역을 입력해주세요." maxlength="5">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="email" name="email" placeholder="이메일을 입력해주세요.">
								</div>
								<div>
									<!-- 비밀번호 확인[고민] <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div> -->
								</div>
								<input type="button" id="sigh" name="sigh" value="회원가입"
									class="btn btn-primary btn-user btn-block">
							</form>
							<hr>
							<a href="Index.jsp" class="btn btn-google btn-user btn-block"
								style="border-radius: 19px"> 다시 로그인 하러가기 </a>


							<hr>
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

</body>

</html>
