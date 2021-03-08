<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ page import="guest.dao.GuestbookDao"%>
<%@ page import="java.util.List"%>
<%@ page import="guest.vo.GuestbookVo"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	// 줄바꿈 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>방명록</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>방명록</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->
<!-- CSS //  -->	<style type="text/css">
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
	
	#title {
		text-align: center;
	}
</style>
<!-- // CSS -->
<!-- JS // -->
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
</script>
<!-- // JS -->
	
<div id="wrap">	

<br>
<div id="title">
	<b><font size="5" color="gray">방명록</font></b>
</div>
<hr size="1" width="700">
<br>

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
					<a href="/gbook?cmd=GUESTBOOKUPDATEFORM&gb_no=${guestbook.gb_no}">[수정]</a>&nbsp;
					<a href="/gbook?cmd=GUESTBOOKDELETEFORM&gb_no=${guestbook.gb_no}">[삭제]</a><br>
				 	${fn:replace(guestbook.gb_con, cn, br)} <br>
				 </c:forEach>	
			 		<hr size="1" width="700">
			</div>
			 	
			<!-- 페이지 부분 -->

		</form>
 	</div>
 	<!-- 글 목록 부분 끝 -->

</div>

<jsp:include page="/footer.jsp"></jsp:include>