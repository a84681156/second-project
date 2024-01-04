<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <!-- 로그인 상태에 따라 링크 설정 -->
	<c:set var="loginOutLink" value="${sessionScope.user==null ? '/loginC/loginPage' : '/loginC/logout' }" />
	<!-- 화면에 표시되는 문자 설정 -->
	<c:set var="loginOut" value="${sessionScope.user==null ? '로그인' : '로그아웃' }" />
    <div class="headerIn">
    	<div class="headerUp">
	        <div class="logo">
	            <a href="<c:url value='/'/>">
	            	<img src="<c:url value='/img/asd.png'/>" alt="헤더로고">
	            </a>
	        </div>
	        
	        <%
	        	Object user = session.getAttribute("user");
	        %>
	        
	        <div class="info">
	        	|
	        	<li class="my">
		        	<a href="<c:url value='/managment/myInfo'/>">내정보</a>
	        	</li>
	        	|
	        	<li>접속자: ${user.name }</li>
	        	|
	        	<li>권한: ${user.cd_user_gt }</li>
	        	|
	        </div>
    	</div>
        
        <div style="display: flex; justify-content: space-between; width: 1000px; margin: 25px auto; font-size: 20px;">
	    	<a href="<c:url value='${loginOutLink }'/>">${loginOut }</a>
	        <a href="<c:url value='/regiState/list?msg='/>">사용자관리</a>
	        <a href="<c:url value='/notice/list'/>">공지사항</a>
	        <%-- <a href="<c:url value='/notice/modify'/>">공지사항수정</a> --%>
	        <a href="<c:url value='/codeManage/list2'/>">코드관리 공통코드</a>
	        <a href="<c:url value='/tsp05100/page'/>">안전법규및규정</a>
	        <a href="<c:url value='/tsp02210/page'/>">위험성평가</a>
	    </div>
    </div>
</header>