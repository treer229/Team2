<%@page import="kr.or.bit.dao.TravelReviewDao"%>
<%@page import="kr.or.bit.dto.TravelReview_Comments"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.bit.dto.TravelReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Custom fonts for this template -->
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="css/sb-admin-2.min.css" rel="stylesheet">
	<!-- Custom styles for this page -->
	<link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>board_content</title>
	<%
	TravelReview boarddto = (TravelReview)request.getAttribute("boarddto");
	String tr_num = (String)request.getAttribute("tr_num");
	String tr_title = (String)request.getAttribute("tr_title");
	String cpage = (String)request.getAttribute("cpage");
	String pagesize = (String)request.getAttribute("pagesize");
	String id = (String)request.getAttribute("id");
	TravelReviewDao dao = (TravelReviewDao)request.getAttribute("dao");
	%>
	
	<script type="text/javascript">
	
		$(function(){
			getReplyList();
			addreply();
		})
		
		
		var data = {
					tr_num : <%=tr_num%>,
					ps: <%=pagesize%>,
					cp: <%=cpage%>
				   }	
		
		function getReplyList(){
			
			$.ajax({
				url:"TravelReviewCommentList.TravelReview",
				datatype:"JSON",
				data: data,
				type:"POST",
				success: function(data){
					jsonarray = JSON.parse(data);
		
					$("#replytable").find("tr").not(":first").remove();
					if(data !=null){
						$.each(jsonarray,function(){
							$("#replytable").find("tr:last").after(
								'<tr align="left"><td width="80%"> 작성자  : '
								+ this.id + '&nbsp;&nbsp;&nbsp;' + this.comment_date
								+ '<br><br>' + this.content 
								+ '<hr></td><td><form action="TravelReviewCommentDeleteOk.TravelReview" method="POST" name="replyDel">'
								+ '<input type="hidden" name="comment_num" value=' + this.comment_num + '>'
								+ '<input type="hidden" name="id" value=' + "${sessionScope.id}" + '>'
								+ '<input type="submit" value="삭제" onclick="reply_del(this.form)" class ="btn" id = "CommentDelete">'
								+ '</form></td></tr>'								
							)
						})
					}
				}
			
			})
			
		}
		function addreply(){
			$('#send').on("click",function(){
			
				var frm = document.reply;
				
				if (frm.reply_content.value == "") {
					alert("내용을 입력해주세요");
					return false;
				}
				
				var param = {
						       "tr_num":<%=tr_num%>,
							   "id": '<%=id%>',
							   "content": $('#reply_content').val()
						    };
				
				
				$.ajax({
					url:"TravelReviewCommentOk.TravelReview",
					datatype:"text",
					data:param,
					success: function(data){
						if(data.trim()=="success"){
							getReplyList();
							$('#reply_writer').val("");
							$('#reply_pwd').val("");
							$('#reply_content').val("");
						}else{
							alert("댓글등록실패");
						}
						
					}
					
				})
				return false;
			})
		}
	
	
		function reply_del(frm) {
			var check = confirm("정말로 삭제하시겠습니까?");	;
			$(frm).on("submit",function(){				
				var data = $(this).serialize();

	            if (!check) {
	               return false;
	            }
				
				$.ajax({
					url:"TravelReviewCommentDeleteOk.TravelReview",
					datatype:"text",
					data:data,
					success:function(data){
							
						if(data.trim()=="success"){
							getReplyList();
						}else{
						}
					}
				
				})
			
				return false;
			})
		}
		
	</script>
	
	<style type="text/css">
	#CommentDelete {
	float: right
	}
	</style>
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
		<h6 class="m-0 font-weight-bold text-primary">여행후기 게시판</h6>
	</div>
	<div id="pagecontainer">
		<div class="card-body" style="padding-top: 30px; text-align: center">
			<center>
				<table class = "table table-bordered dataTable" width="80%" border="1" cellspacing="0" align="center">
										<tr>
						<td width="20%" align="center"><b>제목</b></td>
						<td colspan="3"><%= boarddto.getTr_title()%></td>
					</tr>
					
					<tr>
						<td width="20%" align="center"><b>조회수</b></td>
						<td><%= boarddto.getViews()%></td>
						<td width="20%" align="center"><b>첨부파일</b></td>
						<td><%= boarddto.getFilesize()%>bytes</td>
					</tr>
					<tr>
						<td width="20%" align="center"><b>작성자</b></td>
						<td width="30%"><%= boarddto.getId() %></td>
						<td width="20%" align="center"><b>작성일</b></td>
						<td><%= boarddto.getCreated_date() %></td>
					</tr>
					<tr style = "height: 500px">
						<td width="20%" align="center"><b>글내용</b></td>
						<td colspan="3">
							<%
								String content = boarddto.getContent();
								if(content != null){
									content = content.replace("\n", "<br>");
								}
								out.println(content);
							%>
						
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<a href="TravelReviewList.TravelReview?cp=<%= cpage %>&ps=<%= pagesize %>">목록가기</a>
							<c:set var="id" value="<%=boarddto.getId()%>"/>
							<c:if test="${sessionScope.id==id}">
								&nbsp;<a href="TravelReviewEditForm.TravelReview?tr_num=<%=tr_num%>&cp=<%= cpage %>&ps=<%= pagesize %>">수정하기</a>
								&nbsp;<a href="TravelReviewDeleteCheck.TravelReview?tr_num=<%=tr_num%>&id=<%=boarddto.getId()%>">삭제</a>
							</c:if>
				            &nbsp;<a href="TravelReviewRewrite.TravelReview?tr_num=<%= tr_num %>&cp=<%= cpage %>&ps=<%= pagesize %>&tr_title=<%=boarddto.getTr_title()%>">답글</a>									
						</td>
					</tr> 
				</table> 
		<form name="reply" id="reply" method="POST"> 
				<input type="hidden" name="tr_num" value="<%= tr_num %>">
				<input type="hidden" name="userid" value="${sessionScope.id==id}">
				<table id ="replytable" width="100%" style="border: 1px solid white; border-bottom-color: lightgray; border-top-color: lightgray">
					<tr><th colspan="2">Comment<hr></th></tr>
				</table>  
					<table class = "table table-bordered dataTable" width="80%" border="1">
						<tr>
							<th colspan="2">댓글 달기</th>
						</tr>
						<tr>
							<td>
							<div style = "display: flex"> 
								<div style = "width :90%;">
								 <input type = "text" name="reply_content" id="reply_content" class="form-control form-control-user" style = "height: 100px">
								</div>
								<div>
								<input type="button" class= "btn btn-primary"  id="send" value="등록" style = " width :100px;height: 100px; margin-left: 2em">
								</div>
							</div>
							</td>
						</tr>
					</table> 
			</form>
	<br>
		
		</center>
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