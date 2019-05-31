<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">


    $(function () {
        $('input[name=edit]').click(function () {
            var index = $('input[name=edit]').index(this);
            var cl_num = $("input[name=editnum]").eq(index).val();

            $("#myModal").modal();
            
			  $.ajax({
		          url: "edit.Checklist", 
		          type:'post',
		          data: {cl_num : $("input[name=editnum]").eq(index).val()},
		          dataType:'html',
		          success:function(data){
		          $('.modal-body').html(data);
		          }
		      })


        }); 

        $('input[name=del]').click(function () {
            var index = ($('input[name=del]').index(this));
            var url = $('#delform').attr('action');
            console.log($('input[name=delnum]').eq(index).val());

            var check = confirm("정말로 삭제하시겠습니까?")

            if (check) {
            } else {
                alert('삭제를 취소합니다.');
                return
            }

            $.ajax({
                url: url,
                data: { cl_num: $('input[name=delnum]').eq(index).val(),id:$("#id").val() },
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
	<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>

      <!-- Main Content -->
      <div id="content">
	
        <!-- /.container-fluid -->
             <br>
        <div style = "text-align: right ; margin-right: 5em">
    		<a href="Write.Checklist" class = "btn btn-success">작성하기</a>
    	</div> 
  		<div class="card o-hidden border-0 shadow-lg my-5" style = "width :90%; margin-left: 5em">
	<div class="card-body p-0" id="content"> 
 <div class="container-fluid">       
<div id="listmain">
    <div>

    <div style = "column-count: 2">
    	 <div style = "text-align: center;">체크리스트 목록</div>
         <div style = "text-align: right">수정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제&nbsp;&nbsp;</div>
    </div>
    <br>
    <br>
        <div>
            <c:forEach var="i" items="${list }">
               <div style = "height: 45px;">
                    <a href="CheckContent.Checklist?num=${i.cl_num }" id="contents">${i.cl_title }</a>
                     <div style = "float: right; height: 40px;" >
                        <form action="del.Checklist" method="post" id="delform" name="delform">
                            <input type="hidden" id="delnum${var.index }" name="delnum${var.index }"
                                value="${i.cl_num }"> 
                                <input type = "hidden" id = "id" name = "id" value="${sessionScope.id }">
                            <input type="button" class ="btn btn-danger" id="del" name="del" value="삭제">
                        </form>
						</div> 
                   		 <div style = "float: right; height: 40px;">
                            <input type="hidden" id="editnum${var.index }" name="editnum${var.index }"
                                value="${i.cl_num }">
                            <input type="button" class = "btn btn-success" id="edit" name="edit" value="수정">
                            <br>
                            <br>
                            <div class="modal fade" id="myModal">
								<div class="modal-dialog">
									<div class="modal-content">

										<div class="modal-header">
											<h4 class="modal-title">체크리스트 내용 추가하기</h4>
											<button type="button" class="close" data-dismiss="modal">x</button>
										</div>
										<div class="modal-body">
										</div>

									</div>
								</div>
							</div>
                    </div>
				</div>
				<hr>
            </c:forEach>
               </div> 
            </div>
        </div>
    </div>

</div>
</div>
</div>
<jsp:include page="/WEB-INF/Common/Bottom.jsp"></jsp:include>
      <!-- End of Main Content -->
</div>

</body>

</html>