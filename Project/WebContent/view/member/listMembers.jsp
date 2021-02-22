<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<html>
<head>
<c:choose>
	<c:when test='${msg=="addMember" }'>
		<script>
			window.onload = function() {
				alert("회원을 등록했습니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="modMember" }'>
		<script>
			window.onload = function() {
				alert("회원 정보를 수정했습니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="delMember" }'>
		<script>
			window.onload = function() {
				alert("회원 정보를 삭제했습니다.");
			}
		</script>
	</c:when>
</c:choose>

<meta charset="UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>
	<p>회원정보</p>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
			<td>가입일</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<c:choose>
			<c:when test="${empty  membersList}">
				<tr>
					<td colspan=7>등록된 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${!empty membersList}">
				<c:forEach var="mem" items="${membersList }">
					<tr>
						<td>${mem.id }</td>
						<td>${mem.pwd }</td>
						<td>${mem.nickname}</td>
						<td>${mem.email }</td>
						<td>${mem.joindate}</td>
						<td><a href="${contextPath}/member/modMemberForm.do?id=${mem.id }">수정</a></td>
						<td><a href="${contextPath}/member/delMember.do?id=${mem.id }">삭제</a></td>

					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href="${contextPath}/member/addMemberForm.do"><p>회원 가입</p></a>
</body>
</html>
