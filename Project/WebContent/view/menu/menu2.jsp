<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>소개</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>소개</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<div style="text-align: center">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	프로젝트 멤버 : <br>
	담당 역할 	  : <br>
	프로젝트 목표 : 스프링을 활용한 풀스택 개발<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
</div>

<jsp:include page="/footer.jsp"></jsp:include>