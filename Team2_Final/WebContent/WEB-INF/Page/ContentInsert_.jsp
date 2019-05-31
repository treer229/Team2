<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="writeContentOk.Checklist?num=${num }" method="post">
<input type = "text" id = "content" name = "content" placeholder="내용을 입력해주세요.(50)" class = "form-control form-control-user" style ="height: 70px">
<br>
<input type = "submit" value="추가 하기" class="btn btn-success">
</form>