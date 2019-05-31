<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="card o-hidden border-0 shadow-lg my-5" style = "width :90%; margin-left: 5em">
	<div class="card-body p-0" id="content"> 
 <div class="container-fluid">
    	 <div style = "text-align: center;">체크리스트 추가하기</div>
<form action ="writeok.Checklist" method = "post">
	작성자 : <input type ="hidden" id = "id" name = "id" value ="${sessionScope.id }">${sessionScope.id }<br>
	체크리스트 이름 :
	<input type ="text" class="form-style" id = "title" name = "title"><br>
	<input type ="submit" class="btn btn-success" style = "float: right" value = "추가하기">
	<br>
	<br>
</form>
      <!-- End of Main Content --> 
</div> 
</div>
</div>
</div>
</div>
</div>
<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>
