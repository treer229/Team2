<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
    $(function () {
        $('input[name=del]').click(function () {
            var index = ($('input[name=del]').index(this));
            var url = $('#delform').attr('action');

            var check = confirm("정말로 삭제하시겠습니까?")

            if (!check) {
                alert('삭제를 취소합니다.');
                return
            }

            $.ajax({
                url: url,
                data: {
                    clc_num: $('input[name=delnum]').eq(index).val(),
                    num: $('input[name=num]').eq(index).val()
                },
                type: "post",
                success: function (data) {
                    alert($('input[name=delnum]').eq(index).val() + "번 체크리스트 삭제 완료");
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
<style>
	.flex{
		display: flex;
		align-items: center;
	}
</style>
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
				<div class="card o-hidden border-0 shadow-lg my-5"
					style="width: 90%; margin-left: 5em">
					<div class="card-body p-0" id="content">
						<div class="container-fluid">
							<div id="listmain">

								<hr>
								<h3>제목 : 회원관리</h3>
								<hr>
								<table class="table" class="flex">
									<tr>
										<th>ID</th>
										<th>PASSWARD</th>
										<th>NAME</th>
										<th>GENDER</th>
										<th>email</th>
										<th></th>
									</tr>
									<c:forEach var="list" items="${member}">
										<tr>
											<th>${list.id }</th>
											<th>${list.password }</th>
											<th>${list.name }</th>
											<th>${list.gender }</th>
											<th>${list.email }</th>
											<th>
												<form action="deleteContent.Checklist" method="post" id="delform" name="delform">
													<input type="submit" class="btn btn-danger" id="del" name="del" value="삭제"> 
													<input type="hidden" id="${list.id }">
												</form>
											</th>
										</tr>
									</c:forEach>
								</table>
								<hr>
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