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
      <h2>이두·삼두 운동</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li><a href="${contextPath}/menu3.jsp">운동</a></li>
        <li>이두·삼두 운동</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<div style="text-align: center">
	<img width = "200px" height = "200px" src="/images/4_1.jpg"	/><br>
	<img width = "200px" height = "200px" src="/images/4_2.jpg"	/>
</div>

<jsp:include page="/footer.jsp"></jsp:include>