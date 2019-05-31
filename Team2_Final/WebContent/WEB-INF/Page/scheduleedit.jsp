<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
    var startdate = $('#startdate').val();
    var enddate = $('#enddate').val();
    
   	$(function(){
  		$('#start').attr("value",startdate.substr(0,10));
  		$('#end').attr("value",enddate.substr(0,10));
 });
    </script>
<form action ="editok.Schedule" method = "post" id = "editform" name = "editform">
	<input type = "hidden" id="num" name = "num" value ="${schedule.schedule_num }"><br>
	 스케줄 이름<br><input type = "text" class="form-control" id="title" name = "title" value ="${schedule.schedule_title }" placeholder="스케줄이름">
	<hr>
	<input type = "hidden" id="id" name = "id" value ="${schedule.id }">
	 시작일 <br><input type = "hidden" class="form-control" id="startdate" name = "startdate" value="${schedule.schedule_start }"><br>
	 <input type = "date" class="form-control" id="start" name = "start"><br>
	 끝나는 일 <br><input type = "date" class="form-control" id="end" name = "end"><br>
	 <input type = "hidden" class="form-control" id="enddate" name = "enddate" value="${schedule.schedule_end }"><br>
	<input type ="submit" class= "btn btn-success" value = "수정하기" id = "edit" name ="edit" style ="float: right">
	
</form> 
