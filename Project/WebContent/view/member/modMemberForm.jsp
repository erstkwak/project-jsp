<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<<<<<<< HEAD
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>회원 수정</title>
</head>
<body>
	<h1>회원 수정</h1>
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
				<td><input type="text" name="joindate" value="${memInfo.joindate}" disabled></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정하기">
					<input type="reset" value="다시입력">
				</td>
			</tr>
		</table>
	</form>
</html>
=======
<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>관리자 화면</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>관리자 화면</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<form action="${contextPath}/member/modMember.do?id=${memInfo.id}" method="POST">
				  <div class="form-group">
				    <label for="id">아이디</label>
				    <input type="text" class="form-control" name="id" id="id" value="${memInfo.id}" disabled>
				  </div>
				  <div class="form-group">
				    <label for="pwd">비밀번호</label>
				    <input type="password" class="form-control" name="pwd" id="pwd" value="${memInfo.pwd}" aria-describedby="pwdHelp">
				    <small id="pwdHelp" class="form-text text-muted">비밀번호는 4 ~ 20 자로 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="nickname">닉네임</label>
				    <input type="text" class="form-control" name="nickname" id="nickname" value="${memInfo.nickname}" aria-describedby="nicknameHelp">
				    <small id="nicknameHelp" class="form-text text-muted">닉네임은 4 ~ 20자 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="email">이메일</label>
				    <input type="email" class="form-control" name="email" id="email" value="${memInfo.email}" aria-describedby="emailHelp">
				    <small id="emailHelp" class="form-text text-muted">이메일을 올바르게 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="joindate">가입일</label>
				    <input type="text" class="form-control" name="joindate" id="joindate" value="${memInfo.joindate}" disabled>
				  </div>
				  <input type="submit" class="btn btn-secondary" value="정보수정">
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp"></jsp:include>
>>>>>>> 75aa3e26e6b4df41006331032484b343abe009d7
