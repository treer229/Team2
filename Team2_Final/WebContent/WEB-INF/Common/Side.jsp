<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <jsp:include page="/WEB-INF/Common/Css.jsp"></jsp:include>
  
    
 <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" >

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Main.do">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
          
        </div>
        <div class="sidebar-brand-text mx-3">여행이 좋다, <sup>Team2</sup></div>
      </a>

      <hr class="sidebar-divider my-0">

 <li class="nav-item">
        <a class="nav-link" href="Main.do?id=${sessionScope.id }">
          <img alt="icon" src="img/Icon/MainIcons.png">
          <span>메인</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="MemberEdit.do">
          <img alt="icon" src="img/Icon/EditIcon.png">
          <span>정보 수정</span></a>
      </li>
        <li class="nav-item">
        <a class="nav-link" href="insert.Schedule">
          <img alt="icon" src="img/Icon/SetIcon.png">
          <span>나의 스케줄</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="read.Checklist?id=${sessionScope.id }">
          <img alt="icon" src="img/Icon/TIcon.png">
          <span>체크 리스트</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="TravelReviewList.TravelReview">
          <img alt="icon" src="img/Icon/ReViewIcon.png">
          <span>여행 후기</span></a>
      </li>
          <li class="nav-item">
        <a class="nav-link" href="NoticeList.Notice?id=${sessionScope.id }">
          <img alt="icon" src="img/Icon/CenterIcon.png">
          <span>공지사항</span></a>
      </li>
      <c:set var = "member" value ="${sessionScope.Member }"></c:set>
   <c:if test="${member.admin == 1 }">   
      <hr class="sidebar-divider">
      <div class="sidebar-heading">
        Add
      </div>

      <li class="nav-item">
        <a class="nav-link" href="adminsearch.Member">
          <img src="img/Icon/vipIcon.png">
          <span>관리자페이지</span></a>
      </li>
    </c:if>


      <hr class="sidebar-divider d-none d-md-block">

      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
         