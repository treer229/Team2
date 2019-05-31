<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:forEach var="i" items="${listmember }">
<span>당신의 아이디는 ${i.id } 입니다.</span><br>
</c:forEach>

