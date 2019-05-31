<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/Animation.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/LoginForm.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//유효성 검사
		$("#login").click(function(){
	         if($("#id").val()==""){
	             alert("ID를 입력해주세요.");
	             $("#id").focus();
	             return false;
	         }else if($("#password").val() ==""){
	             alert("비밀번호를 입력해주세요.");
	             $("#password").focus();
	             return false;
		     }else{
	             $('#loginform').submit();
	         } 
	     });
		

	});
	  function IdPopup() { 
		  window.open("IdSearch.jsp",
				  	  "아이디 찾기",
				  	  "width=1000, height=500, left=100, top=50"); 
		  }
	  function PwdPopup() { 
		  window.open("PasswordSearch.jsp",
				  	  "비밀번호 찾기",
				  	  "width=1000, height=500, left=100, top=50"); 
		  }
</script>
<style type="text/css">
body {
	background-image: url('img/homeback.jpg');
    background-repeat:no-repeat;
    background-size: 100% 800px;
    min-height: 100%;
    text-align: center;
   
}

</style>
</head>
<body>
<br>
<br>
<div class="animated bounceInDown ">
<div>
	<img alt="로고" src="img/xx.png">
	
	</div>
	
</div>
<div class = "animated zoomIn">
	<div id="formWrapper">

		<div id="form">
		<div class="logo">
		<h1> Login</h1>
		</div>
		<form action = "Loginok.do" method = "post" id= "loginform" name="loginform">
				<input type="text" name="id" id="id" class="form-style" autocomplete="off" placeholder="ID"/>
				<br>
				<input type="password" name="password" id="password" class="form-style" placeholder="Password" />
				<br>
		<div class="form-item">
			<p class="pull-left"><a href="SighUp.do"><small>회원 가입</small></a></p>
			<input type="button" class="login pull-right"  id = "login" name = "login" value="로그인">
			<br>
		</div>
				<p><a href="javascript:IdPopup()" ><small>아이디 찾기</small></a>&nbsp;&nbsp;&nbsp;<a href="javascript:PwdPopup()" ><small>비밀번호 찾기</small></a></p>	
		</form>
	</div>
</div>
</div>
</body>
</html>