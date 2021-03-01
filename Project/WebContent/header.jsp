<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>프로젝트 제목</title>
	<meta name="viewport"    content="width=device-width, initial-scale=1">
	<meta name="keywords"    content="키워드1, 키워드2, ...">
	<meta name="description" content="설명">
	<meta name="robots"      content="all">
	<meta name="author"      content="프로젝트 팀원 이름">
	<meta name="date"        content="2021-02-28T09:00+09:00 // 프로젝트 완성 날짜"> 
  <!-- Google Fonts -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap">
	<!-- Vendor CSS -->
  <link rel="stylesheet" href="${contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/icofont/icofont.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/boxicons/css/boxicons.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/animate.css/animate.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/venobox/venobox.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/owl.carousel/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="${contextPath}/assets/vendor/aos/aos.css">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${contextPath}/assets/css/style.css" >
</head>
<body>
	<!-- UNB // -->
  <section id="topbar" class="d-none d-lg-block">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
      	<c:choose>
      		<c:when test="${sessionScope.isLogon eq true}">
      			<span><strong>${sessionScope.login_nickname}</strong> 님 환영합니다 ^^</span>
					</c:when>
      	</c:choose>
      </div>
      <div class="social-links">
      	<c:choose>
      		<c:when test="${sessionScope.isLogon eq true}">
      			<a href="${contextPath}/member/logoutMember.do">로그아웃</a>
      			<a href="${contextPath}/member/myInfo.do">내 정보 관리</a>
      		</c:when>
      		<c:otherwise>
      			<a href="${contextPath}/member/loginMember.do">로그인</a>
      			<a href="${contextPath}/member/addMemberForm.do">회원가입</a>
      		</c:otherwise>
      	</c:choose>
	        <a href="#">링크1</a>
	        <a href="#">링크2</a>
        <c:choose>
        	<c:when test="${sessionScope.login_id eq 'admin'}">
        		<a href="${contextPath}/member/adminInfo.do">관리자</a>
        	</c:when>
        </c:choose>
      </div>
    </div>
  </section>
	<!-- // UNB -->
	<!-- Header // -->
  <header id="header">
    <div class="container d-flex">
      <div class="logo mr-auto">
        <h1 class="text-light"><a href="${contextPath}/">프로젝트 제목</a></h1>
      </div>
			<!-- GNB // -->
      <nav class="nav-menu d-none d-lg-block">
        <ul>
        	<li><a href="${contextPath}/view/menu/menu1.jsp">메뉴1</a></li>
        	<li><a href="${contextPath}/view/menu/menu2.jsp">메뉴2</a></li>
          <li class="drop-down"><a href="${contextPath}/view/menu/menu3.jsp">메뉴3</a>
          	<ul>
          		<li><a href="${contextPath}/view/menu/menu3_1.jsp">서브메뉴1</a></li>
          		<li><a href="${contextPath}/view/menu/menu3_2.jsp">서브메뉴2</a></li>
          	</ul>
          </li>
          <li class="drop-down"><a href="${contextPath}/view/menu/menu4.jsp">메뉴4</a>
          	<ul>
          		<li><a href="${contextPath}/view/menu/menu4_1.jsp">서브메뉴1</a></li>
          		<li><a href="${contextPath}/view/menu/menu4_2.jsp">서브메뉴2</a></li>
          	</ul>
          </li>
          <li class="drop-down"><a href="${contextPath}/view/menu/menu5.jsp">메뉴5</a>
          	<ul>
          		<li><a href="${contextPath}/view/menu/menu5_1.jsp">서브메뉴1</a></li>
          		<li><a href="${contextPath}/view/menu/menu5_2.jsp">서브메뉴2</a></li>
          	</ul>
          </li>
          <li class="drop-down"><a href="${contextPath}/view/menu/menu6.jsp">메뉴6</a>
          	<ul>
          		<li><a href="${contextPath}/view/menu/menu6_1.jsp">서브메뉴1</a></li>
          		<li><a href="${contextPath}/view/menu/menu6_2.jsp">서브메뉴2</a></li>
          	</ul>
          </li>
        </ul>
      </nav>
      <!-- // GNB -->
    </div>
  </header>
  <!-- // Header -->