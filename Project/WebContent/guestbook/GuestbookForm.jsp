<%@page import="guest.dao.GuestbookDao"%>
<%@page import="java.util.List"%>
<%@page import="guest.vo.GuestbookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	// 줄바꿈 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html>

<html>
<head>
	<title>방명록</title>
	
	<style type="text/css">
		#wrap {
			width: 700px;
			margin: 0 auto 0 auto;
		}
		
		#comment{
			text-align :left;
		}
		
		#listGuestForm{
			text-align :center;
			/*overflow:scroll; 
    		overflow-x:hidden; 
    		height:220px;*/
		}
		
		#writeGuestForm, #pageForm{
			text-align :center;
		}
	</style>
	
	<script type="text/javascript">
		// 입력값 체크
		function checkValue()
		{
			if(!document.guestbookInfo.guestbook_id.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_password.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(!document.guestbookInfo.guestbook_content.value){
				alert("내용을 입력하세요.");
				return false;
			}
		}
		
		// 답글창 open
		function openReplyForm(guestbook_no)
		{
			// window.name = "부모창 이름"; 
			window.name = "replyForm";
			// window.open("open할 window", "자식창 이름", "팝업창 옵션");
			window.open("GuestbookReplyFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"rForm", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		// 삭제창 open
		function openDelForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookDeleteFormAction.ge?num="+guestbook_no,
					"delForm", "width=570, height=350, resizable = no, scrollbars = no");
		}
		
		// 수정창 open
		function openUpdateForm(guestbook_no)
		{
			window.name = "parentForm";
			window.open("GuestbookUpdateFormAction.ge?num="+guestbook_no+"&page=${spage}",
					"updForm", "width=570, height=350, resizable = no, scrollbars = no");
		}

	</script>
		
</head>
<body>

	<br>
	<b><font size="5" color="gray">방명록</font></b>
	<hr size="1" width="700">
	<br>
	
<div id="wrap">	

	<!-- 글 등록 부분 시작-->
	<div id="writeGuestForm">
		<form action="/gbook?cmd=GUESTBOOKWRITE" name="guestbookInfo" method="post" onsubmit="return checkValue()" >
			<table width="700">
				<tr>
				  <td>이름 : </td>
			 	  <td><input type="text" name="guestbook_id"></td>
				  <td>비밀번호 : </td>
				  <td><input type="password" name="guestbook_password"></td>
				</tr>
				<tr>
				  <td colspan="4">&nbsp;</td></tr>
				<tr>
				  <td colspan="4">
				  <textarea rows="7" cols="80" name="guestbook_content"></textarea>
				  </td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등록">
		</form>
	</div>
	<!-- 글 등록 부분 끝-->

	<!-- 글 목록 부분 시작 -->
	<div id="listGuestForm">
		<form method="post" name="">
		
			<!-- 방명록 내용 부분 -->
			<div id="comment">
				<c:forEach var="guestbook" items="${ requestScope.gbList }">
					<hr size="1" width="700">		
					<label>${guestbook.gb_id}</label>&nbsp;&nbsp;&nbsp;
					<label>${guestbook.gb_date}&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<a href="#" onclick="openReplyForm(${guestbook.gb_no})">[답변]</a>&nbsp;
					<a href="#" onclick="openUpdateForm(${guestbook.gb_no})">[수정]</a>&nbsp;
					<a href="#" onclick="openDelForm(${guestbook.gb_no})">[삭제]</a><br>
				 	${fn:replace(guestbook.gb_con, cn, br)} <br>
				 </c:forEach>	
			 		<hr size="1" width="700">
			</div>
			 	
			<!-- 페이지 부분 -->
		 	<div id="pageForm">
				<c:if test="${startPage != 1}">
					<a href='GuestbookListAction.ge?page=${startPage-1}'>[ 이전 ]</a>
				</c:if>
				
				<c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
					<c:if test="${pageNum == spage}">
						${pageNum}&nbsp;
					</c:if>
					<c:if test="${pageNum != spage}">
						<a href='GuestbookListAction.ge?page=${pageNum}'>${pageNum}&nbsp;</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage != maxPage }">
					<a href='GuestbookListAction.ge?page=${endPage+1 }'>[다음]</a>
				</c:if>
			</div> 
		</form>
 	</div>
 	<!-- 글 목록 부분 끝 -->

</div>
 	
</body>
</html>