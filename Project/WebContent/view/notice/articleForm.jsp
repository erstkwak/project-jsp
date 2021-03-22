<%@ page 
    language="java" 
    contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<%
    request.setCharacterEncoding("UTF-8");
%> 

<jsp:include page="/header.jsp"></jsp:include>

<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>공지사항</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>공지사항</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/notice/listArticles.do";
    obj.submit();
  }
</script>

<div class="container">
  <div class="row justify-content-center" data-aos="fade-up">
    <form name="articleForm" method="post" action="${contextPath}/notice/addArticle.do" enctype="multipart/form-data">
      <table class="table">
        <h1>글 작성</h1>
        <tr>
          <td>상단 고정 여부</td>
          <td colspan="2">
            <input type="radio" name="notice_yn" value="y" /> 고정
            <input type="radio" name="notice_yn" value="n" checked /> 일반
          </td>
        </tr>
        <tr>
          <td>제목: </td>
          <td colspan="2">
            <input type="text" size="67" maxlength="500" name="title" />
          </td>
        </tr>
        <tr>
          <td>내용: </td>
          <td colspan=2><textarea name="content" rows="10" cols="65" maxlength="4000"></textarea></td>
        </tr>
        <tr>
          <td>이미지 첨부: </td>
          <td><input type="file" name="imageFileName" onchange="readURL(this);" /></td>
          <td><img id="preview" src="#" width=200 height=200 /></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="글쓰기" />
            <input type="button" value="목록" onClick="backToList(this.form)" />
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
  
<jsp:include page="/footer.jsp"></jsp:include>