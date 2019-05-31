<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function () {
        $('input[name=edit]').click(function () {
            var index = $('input[name=edit]').index(this);
            var url = $('#editform').attr('action');
            var cl_num = $("input[name=editnum]").eq(index).val();


            $.ajax({
                url: url,
                data: { cl_num: cl_num },
                type: "post",
                success: function (data) {
                    $("#listmain").empty();
                    $("#listmain").append(data);

                },
                error: function (xhr) {
                    alert('이동 실패 : ' + xhr.status);
                }
            });


        });

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
                            <input type="button" class ="btn btn-danger" id="del" name="del" value="삭제">
                            <input type="hidden" id="delnum${var.index }" name="delnum${var.index }"
                                value="${i.cl_num }"> 
                                <input type = "hidden" id = "id" name = "id" value="${sessionScope.id }">
                        </form>
						</div> 
                    <div style = "float: right; height: 40px;">
                        <form action="edit.Checklist" method="post" id="editform" name="editform">
                            <input type="button" class = "btn btn-success" id="edit" name="edit" value="수정">
                            <input type="hidden" id="editnum${var.index }" name="editnum${var.index }"
                                value="${i.cl_num }">
                        </form>
                    </div>
				</div>
				<hr>
            </c:forEach>
               </div> 
            </div>
        </div>
