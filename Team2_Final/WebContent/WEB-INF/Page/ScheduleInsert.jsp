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

<link href='packages/core/main.css' rel='stylesheet' />
<link href='packages/daygrid/main.css' rel='stylesheet' />
<link href='packages/timegrid/main.css' rel='stylesheet' />
<script src='packages/core/main.js'></script>
<script src='packages/interaction/main.js'></script>
<script src='packages/daygrid/main.js'></script>
<script src='packages/timegrid/main.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	var title = new Array();
	var startd = new Array();
	var end = new Array();
	var content = new Array();

	function formatDate(date) {
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
				+ date.getDate();
	}

	$(function() {

		$('#insert').click(function() {
			if ($("#title").val() == "") {
				alert("스케줄을 선택 해주세요.");
				$("#password").focus();
				return false;
			} else if ($("#schedule_start").val() == "") {
				alert("스케줄을 선택 해주세요.");
				$("#schedule_start").focus();
				return false;
			} else if ($("#schedule_end").val() == "") {
				alert("스케줄을 선택 해주세요.");
				$("#schedule_end").focus();
				return false;
			} else {
				alert('등록 완료');
				$('#scinsert').submit();
			}
		});

		var url = "list.Schedule";
		$.ajax({
			dataType : "json",
			data : {
				id : $('#id').val()
			},
			method : "POST",
			url : url, //list.Schedule
			success : function(data) {
				var list = data.list;
				$.each(list, function(index, value) {
					title[index] = value.schedule_title;
					startd[index] = value.schedule_start;
					end[index] = value.schedule_end;
					content[index] = value.content;
				});
				calendar();

			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		});

	});
	function calendar() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			defaultDate : '2019-05-15',
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				var title = prompt('추가할 일정 이름');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					});
					$('#title').attr("value", title);
					$('#schedule_start').attr("value", formatDate(arg.start));
					$('#schedule_end').attr("value", formatDate(arg.end));
				}
				calendar.unselect()
			},
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				title : title[0],
				start : startd[0],
				end : end[0],
				allDay : content[0]
			}, {
				title : title[1],
				start : startd[1],
				end : end[1],
				allDay : content[1]
			}, {
				title : title[2],
				start : startd[2],
				end : end[2],
				allDay : content[2]
			}, {
				title : title[3],
				start : startd[3],
				end : end[3],
				allDay : content[3]
			}, {
				title : title[4],
				start : startd[4],
				end : end[4],
				allDay : content[4]
			}, {
				title : title[5],
				start : startd[5],
				end : end[5],
				allDay : content[5]
			}, {
				title : title[6],
				start : startd[6],
				end : end[6],
				allDay : content[6]
			}, {
				title : title[7],
				start : startd[7],
				end : end[7],
				allDay : content[7]
			} ]
		});

		calendar.render();
	}
</script>

<style type="text/css">
#calendar {
	max-width: 800px;
	margin: 0 auto;
}

.fc-time {
	display: none;
}

#floatdiv {
	border: 1px solid gray;
	padding: 2em;
	position: fixed;
	width: 700px;
	display: inline-block;
	right: 20%;
	top: 88%;
	background-color: white;
	margin: 0;
	z-index: 5;
}
</style>
<title>여행이 좋다.</title>

</head>
<body id="page-top">

	<div id="wrapper">

		<jsp:include page="/WEB-INF/Common/Side.jsp"></jsp:include>


		<div id="content-wrapper" class="d-flex flex-column">

			<div id="content">

				<jsp:include page="/WEB-INF/Common/Top.jsp"></jsp:include>


				<br> <br>
				<div class="card o-hidden border-0 shadow-lg my-5"
					style="width: 90%; margin-left: 5em">
					<div class="card-body p-0" id="content">
						<br>
						<center>
							<a href="DeleteSchedule.Schedule?id=${sessionScope.id }">스케줄
								고치러가기</a>
						</center>
						<br>

						<div class="container-fluid">
							<br> <br>
							<div id='calendar'></div>


							<div id="floatdiv">
								<form action="insertOk.Schedule" method="post" id="scinsert"
									name="scinsert">
									<div style="display: flex; align-items: center">
										<input type="hidden" class="form-control form-control-user"
											id="id" name="id" value="${sessionScope.id }"> <input
											type="text" class="form-control form-control-user" id="title"
											name="title" readonly placeholder="스케줄 이름">&nbsp;&nbsp;&nbsp;
										<input type="text" class="form-control form-control-user"
											id="schedule_start" name="schedule_start" readonly
											placeholder="시작일">&nbsp;~&nbsp; <input type="text"
											class="form-control form-control-user" id="schedule_end"
											name="schedule_end" readonly placeholder="종료일">

										&nbsp;&nbsp;&nbsp; <input type="button"
											class="btn btn-primary" id="insert" name="insert"
											value="등록하기" style="float: right">
									</div>
								</form>
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
