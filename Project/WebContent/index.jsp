<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <style>
  
  </style>
  <script>
		
  </script>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.isLogon eq true}"><a href="${contextPath}/member/logoutMember.do">로그아웃</a></c:when>
		<c:otherwise><a href="${contextPath}/member/loginMember.do">로그인</a> <a href="${contextPath}/member/addMemberForm.do">회원가입</a></c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${sessionScope.login_id eq 'admin'}"><a href="${contextPath}/member/adminPage.do">관리자 페이지로</a></c:when>
	</c:choose>
</body>
</html>