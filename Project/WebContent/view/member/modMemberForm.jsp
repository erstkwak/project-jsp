<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원 수정</title>
</head>
<body>
	<h1>회원 정보 수정창</h1>
	<form method="post" action="${contextPath}/member/modMember.do?id=${memInfo.id}">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${memInfo.id}" disabled></td>

			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" value="${memInfo.pwd}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="nickname" value="${memInfo.nickname}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" value="${memInfo.email}"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="text" name="joinDate" value="${memInfo.joindate }" disabled></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정하기">
				<input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</html>