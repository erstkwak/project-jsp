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

<div>
	<br>
	<br>
	<p style="margin : 80px; font-size: 40px">프로젝트 소개</p><br>
	<p style="text-align:center;font-size: 60px">전국민 건강하게 만들기 프로젝트</p><br>
	<br>
	<br>
	<br>
	<p style="margin : 80px; font-size: 40px">사용프로그램<br>
	<p style="text-align : center ">
	<img width = "1200px" height = "400px" src="/images/icon.jpg"	/>&nbsp;&nbsp;&nbsp;
	</p>
	<p style="margin : 80px; font-size: 40px">프로젝트 멤버 및 담당 역할</p><br>
	<p style="text-align : center; font-size: 50px">곽대희(조장) :   </p><br>
	<p style="text-align : center; font-size: 50px">이동준 :  </p><br>
	<p style="text-align : center; font-size: 50px">최성완 :  </p><br>
	<p style="text-align : center; font-size: 50px">송현우 : 주변헬스장 찾기 </p><br>
	<p style="margin : 80px; font-size: 40px">프로젝트 목표</p><br>
	<p style="text-align :center; font-size: 50px">스프링을 활용한 풀스택 개발</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
</div>

<jsp:include page="/footer.jsp"></jsp:include>