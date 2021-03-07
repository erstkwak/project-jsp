<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div>
	<h3>HEALTH_BOARD_MODIFY</h3>
	<form action="BoardModifyAction.do" method="post">
		<table>
			<tr><!-- BOARD TITLE -->
				<td colspan="2" align="center"><h2>수정</h2></td>
			</tr>
			
				<tr>
					<th>번호</th>
					<td><input name="id" type="text" value="${vo.id}" readonly/></td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td><input name="title" type="text" value="${vo.title}"/></td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="writer_id" type="text" value="${vo.writer_id}" readonly/></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea name="content">${vo.content}</textarea></td>
				</tr>
				
				<tr>
					<th>날짜</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.regdate}" /></td>
				</tr>
	
			<tr>
				<td><input type="submit" value="수정하기"/> </td>
			</tr>
			
			<tr>
				<td colspan="5" align = "center">
					<a href="BoardListAction.do">목록</a>
					<a href="/Project/index.jsp">HOME</a>
				</td>
			</tr>
			
		</table>
	</form>
	</div>
	
</body>
</html>