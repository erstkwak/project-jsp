<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function checkValue()
{
	if (!form.gb_pass.value) {
		alert("비밀번호를 입력하지 않았습니다.");
		return false;
	}
}
</script>
</head>

  <form action="/gbook?cmd=GUESTBOOKDELETE" method="POST">
  <table>
  <caption><h2>방명록 삭제</h2></caption>
  <tr>
    <td colspan="2" class="right"></td>
    <a href="/gbook?cmd=GUESTBOOKLIST">방명록리스트</a>
  </tr>
   <tr>
     <td>글번호</td>
     <td><input type="text" name="gb_no" value="${ param.gb_no }" readonly/></td>
   </tr>
   <tr>
     <td>암호</td>
     <td><input type="password" name="gb_pass" /></td>
   </tr>
   <tr>
     <td colspan="2" class="center">
     <input type="submit" value="삭제" />
     <input type="button" value="창닫기" onclick="window.close()">
     </td>
   </tr>

  </table>
  </form>


</body>
</html>