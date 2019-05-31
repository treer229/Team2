<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "member" value = "${sessionScope.Member }"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#Edit").click(function(){
        if($("#password").val() ==""){
            alert("비밀번호를 입력해주세요.");
            $("#password").focus();
            return false;
	     }else if($("#travel").val() ==""){
            alert("관심지역을 입력해주세요.");
            $("#travel").focus();
            return false;
	     }else if($("#email").val() ==""){
            alert("이메일을 입력해주세요.");
            $("#email").focus();
            return false;
	     }else{
			alert('정보수정 완료');
			$('#complete').attr("class", "animated flipOutX");
			setTimeout(function() {
				$('#editok').submit();
				}, 600);
        } 
    });
	$("#upload").change(function(e) {
	      event.preventDefault();
	      var file = e.target.files[0];
	      var url = URL.createObjectURL(file);
	      $("#memberimg").attr("src", url);
	   });
});

</script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>여행이 좋다.</title>

  <!-- Custom fonts for this template-->


</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>
   
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">
	<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>

        <!-- /.container-fluid -->
        
<div class = "animated fadeIn" id = "complete">
	<div class="container" style = "width : 500px">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
						<div class="p-5" >
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">회원 정보 수정</h1>
							</div>
								<hr>
							<form class="user" action="Editok.do" method="post"  enctype="multipart/form-data" id="editok"
								name="editok">
								<div style = "padding-left: 7.5em">
									<img src ="<c:choose>
		 							<c:when test="${member.filepath != null}">${member.filepath}</c:when>
		 							 <c:when test="${member.filepath == 'img/Memberimg/'}">img/Memberimg/default.jpg</c:when>
		 							<c:otherwise>img/Memberimg/default.jpg</c:otherwise>
									</c:choose>" id = "memberimg" name="memberimg" style = "width : 110px; height: 112px; border: 1px solid lightgray;">
								</div>
								<br>
								<div style = "padding-left: 9em">
									    <label class="btn btn-primary btn-file" >
      										  업로드 <input type="file" id = "upload" name = "upload" style="display: none;">
      										  <input type = "hidden" id = "imgvalue" name = "imgvalue" value="<c:choose>
		 							<c:when test="${member.filepath != null}">${member.filepath}</c:when><c:otherwise></c:otherwise></c:choose>">
   										</label>
								</div>
								<br>
								
								<div>
									<div class="form-group">
										<input type="text" class="form-control form-control-user"
											id="id" name="id" value = "${sessionScope.id }" readonly>
									</div>
								</div>
								<div class="form-group">
									<input type="password" class="form-control form-control-user"
										id="password" name="password" placeholder="비밀번호를 입력해주세요." value ="${member.password }">
								</div>
								<div class="form-group" style="width: 60%; float: left">
									<input type="text" class="form-control form-control-user"
										id="name" name="name" value ="${member.name }" placeholder="이름을 입력해주세요." maxlength="15">
								</div>
								<div style="float: right">
								<c:choose>
									<c:when test="${member.gender == 1 }">	
									<label class="btn btn-primary"> <span class="ico">
										<input type="radio" name="gender" id="gender" value="1" checked>남</span>
									</label> 
									<label class="btn btn-secondary"> <span class="ico">
											<input type="radio" name="gender" id="gender" value="0">여</span>
									</label>
									</c:when>
								<c:otherwise>
									<label class="btn btn-primary"> <span class="ico">
										<input type="radio" name="gender" id="gender" value="1">남</span>
									</label> 
									<label class="btn btn-secondary"> <span class="ico">
											<input type="radio" name="gender" id="gender" value="0" checked>여</span>
									</label>
								</c:otherwise>
								</c:choose>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="travel" name="travel" placeholder="관심 지역을 입력해주세요." maxlength="5" value ="${member.travel }">
								</div>
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="email" name="email" value ="${member.email }" placeholder="이메일을 입력해주세요.">
								</div>
								<div>
									<!-- 비밀번호 확인[고민] <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password">
                  </div> -->
								</div>
								<input type="button" id="Edit" name="Edit" value="정보 수정하기"
									class="btn btn-primary btn-user btn-block">
							</form>
							</div>
						</div>
			</div>

	</div>
      </div>
     </div>
      <!-- End of Main Content -->

<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>

</body>

</html>
