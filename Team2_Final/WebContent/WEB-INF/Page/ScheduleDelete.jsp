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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('input[name=edit]').click(function () {
        var index = $('input[name=edit]').index(this);
        var cl_num = $("input[name=editnum]").eq(index).val();

        $("#myModal").modal();
        
		  $.ajax({
	          url: "edit.Schedule",
	          type:'post',
	          data: { schedule_num : $("input[name=editnum]").eq(index).val()},
	          dataType:'html',
	          success:function(data){
	          $('.modal-body').html(data);
	          }
	      })


    }); 
$('input[name=del]').click(function () {
    var index = ($('input[name=del]').index(this));
    var url = $('#delform').attr('action');

    var check = confirm("정말로 삭제하시겠습니까?")

    if (check) {
    } else {
        alert('삭제를 취소합니다.');
        return
    }

    $.ajax({
        url: url,
        data: { schedule_num: $('input[name=delnum]').eq(index).val(),id:$("#id").val() },
        type: "post",
        success: function (data) {
            alert($('input[name=delnum]').eq(index).val() + "번 스케줄 삭제 완료");
            $("#listmain").empty();
            $("#listmain").append(data);
        },

        error: function (xhr) {
            alert('삭제 실패 : ' + xhr.status);
        }
    });


});
});

</script>
<title>여행이 좋다.</title>

</head>
<body id="page-top">

	<div id="wrapper">

		<jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>

				<br>
				<div class="card o-hidden border-0 shadow-lg my-5"
					style="width: 90%; margin-left: 5em;">
					<div class="card-body p-0" id="content">
						<br> <br>

						<div class="container-fluid">

							<div id="listmain">
								<div>


									<div style="display: flex; justify-content: center">
										<div style="flex-basis: 300px">스케줄 목록</div>
										<div style="flex-basis: 280px">시작일</div>
										<div style="flex-basis: 270px">종료일</div>
										<div style="flex-basis: 40px">수정</div>
										<div style="flex-basis: 40px">삭제</div>
									</div>

									<br> <br>
									<div>
										<c:forEach var="i" items="${list }">
											<div style="height: 45px;">
												<div style="display: flex; justify-content: center">
													<div style="flex-basis: 300px;">${i.schedule_title }
													</div>
													<div style="flex-basis: 280px">${i.schedule_start }</div>
													<div style="flex-basis: 270px">${i.schedule_end }</div>

													<div style="float: right; height: 40px;">
														<input type="hidden" id="editnum${var.index }"
															name="editnum${var.index }" value="${i.schedule_num }">
														<input type="button" class="btn btn-success" id="edit"
															name="edit" value="수정"> <br> <br>
														<div class="modal fade" id="myModal">
															<div class="modal-dialog">
																<div class="modal-content">

																	<div class="modal-header">
																		<h4 class="modal-title">체크리스트 내용 수정하기</h4>
																		<button type="button" class="close"
																			data-dismiss="modal">x</button>
																	</div>
																	<div class="modal-body"></div>

																</div>
															</div>
														</div>
													</div>
													<div style="flex-basis: 60px; height: 40px;">
														<form action="delok.Schedule" method="post" id="delform"
															name="delform">
															<input type="button" class="btn btn-danger" id="del"
																name="del" value="삭제"> <input type="hidden"
																id="delnum${var.index }" name="delnum${var.index }"
																value="${i.schedule_num }"> <input type="hidden"
																id="id" name="id" value="${sessionScope.id }">
														</form>
													</div>
												</div>
											</div>
											<hr>
										</c:forEach>
									</div>
									<a href="insert.Schedule" style="float: right">돌아가기</a>
								</div>
							</div>
						</div>

					</div>
					<br> <br>
				</div>
			</div>
		</div>
	</div>




	<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>



</body>

</html>
