<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HEALTH_BOARD_WRITE</title>
</head>
<body>
	<div>
	<h3>HEALTH_BOARD_WRITE</h3>
	<form method="post" action="BoardWriteAction.do">
			<table>
			
				<thead>
					<tr>
						<th colspan="2">게시판 글쓰기 양식</th>
					</tr>
				</thead>

				<tbody>
				
					<tr>
						<th>제목</th>
						<td><input type="text"  name="title" placeholder="제목" /></td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer_id"  placeholder="작성자" /></td>
					</tr>

					<tr>
						<th>내용</th>	
						<td><textarea  placeholder="내용" name="content"></textarea></td>
					</tr>
					
				</tbody>
				
			</table>
				
			<input type="submit" value="작성완료" />
	</form>
	</div>
</body>
</html>