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
      <h2>운동</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>운동</li>
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
	처음 운동 시작하니 부위마다 어떤 운동을 올바른 자세로 하는지 모르시죠?<br>
	저희가 도와드리겠습니다.<br>
	<br>
	<br>
	<br>
	부위별 운동방법 바로가기<br>
	<a href="/view/menu/menu3_1.jsp">어깨 운동</a><br>
	<a href="/view/menu/menu3_2.jsp">가슴 운동</a><br>
	<a href="/view/menu/menu3_3.jsp">등 운동</a><br>
	<a href="/view/menu/menu3_4.jsp">이두 운동</a><br>
	<a href="/view/menu/menu3_5.jsp">삼두 운동</a><br>
	<a href="/view/menu/menu3_6.jsp">하체 운동</a><br>
	<br>
	<br>
	<br>
</div>

<jsp:include page="/footer.jsp"></jsp:include>