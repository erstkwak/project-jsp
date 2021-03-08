<<<<<<< HEAD
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
=======
>>>>>>> 75aa3e26e6b4df41006331032484b343abe009d7
<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<<<<<<< HEAD

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>회원 가입</title>
</head>
<body>
  <form action="${contextPath}/member/addMember.do">
		<h1>회원 가입</h1>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="nickname"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td><input type="submit" value="가입하기"></td>
				<td><input type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>
=======
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>회원가입</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>회원가입</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<section>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-5">
				<form action="${contextPath}/member/addMember.do" method="POST">
				  <div class="form-group">
				    <label for="id">아이디</label>
				    <input type="text" class="form-control" name="id" id="id" aria-describedby="idHelp">
				    <small id="idHelp" class="form-text text-muted">아이디는 4 ~ 20자 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="pwd">비밀번호</label>
				    <input type="password" class="form-control" name="pwd" id="pwd" aria-describedby="pwdHelp">
				    <small id="pwdHelp" class="form-text text-muted">비밀번호는 4 ~ 20 자로 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="nickname">닉네임</label>
				    <input type="text" class="form-control" name="nickname" id="nickname" aria-describedby="nicknameHelp">
				    <small id="nicknameHelp" class="form-text text-muted">닉네임은 4 ~ 20자 이내로 입력하세요.</small>
				  </div>
				  <div class="form-group">
				    <label for="email">이메일</label>
				    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp">
				    <small id="emailHelp" class="form-text text-muted">이메일을 올바르게 입력하세요.</small>
				  </div>
				  <input type="submit" class="btn btn-secondary" value="회원가입">
				</form>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/footer.jsp"></jsp:include>
>>>>>>> 75aa3e26e6b4df41006331032484b343abe009d7
