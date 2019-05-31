<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function add() {
	  $.ajax({
          url:'writeContent.Checklist',
          type:'post',
          data: {num : $('#num').val(), cl_num: $('#cl_num').val()},
          dataType:'html',
          success:function(data){
          $('.modal-body').html(data);
          }
      })
  }


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

        <!-- /.container-fluid -->
       <body>
<jsp:include page="/WEB-INF/Common/Css.jsp"></jsp:include>
<div id="listmain">

    <hr>
    <h3>제목 : ${title.cl_title }</h3>
    <hr>

    <div>
        <center><div><p>체크리스트 내용</p></div></center>
        <div>


            <c:forEach var="content" items="${content }">

                    ${content.content }
				<div style = "float: right">
                        <form action="deleteContent.Checklist" method="post" id="delform" name="delform">
                            &nbsp;<input type="button" class ="btn btn-danger" id="del" name="del" value="삭제">
                            <input type="hidden" id="delnum${var.index }" name="delnum${var.index }"
                                value="${content.clc_num }">
                            <input type="hidden" id="num${var.index }" name="num${var.index }" value="${title.cl_num }">
                        </form>
                </div>
				<hr>
            </c:forEach>

        </div>
    </div>
     <div style = "text-align: right ; margin-right: 1em">
        <input type="hidden" id="cl_num" name="cl_num" value="${title.cl_num }">
        <input type="hidden" id="num" name="num" value="${num }">
        <input type="button" class = "btn btn-facebook" value="내용추가" id = "addContent" name = "addContent" onclick="add()">
    <br>
    <br>
    <div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title">체크리스트 내용 추가하기</h4>
					<button type="button" class="close" data-dismiss="modal">x</button>
				</div>
				<div class="modal-body"></div>

				</div>
			</div>
	</div>
	
	</div>
</div>


</body>
	<script type="text/javascript">
$(function(){
  $("#addContent").click(function(){
    $("#myModal").modal();
  });
});
</script>
</html>