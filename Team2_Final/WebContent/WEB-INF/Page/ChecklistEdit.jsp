<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="editok.Checklist" method="post">
	<input type="hidden" id="num" name="num" value="${list.cl_num }">
	<input type="hidden" id="id" name="id" value="${list.id}">
	제목 : <input type="text" id="title" name="title" value="${list.cl_title }" class = "form-control form-control-user" style ="height: 40px"><br>
	<input type="hidden" id="color" name="color" value="${list.color }">
	<input type="submit" value ="수정하기" class="btn btn-success" style = "float: right">
</form> 
