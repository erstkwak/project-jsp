<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
  <title>관리자 화면</title>
</head>
<body>
  <a href="${contextPath}/member/listMembers.do">회원조회</a>
</body>
</html>