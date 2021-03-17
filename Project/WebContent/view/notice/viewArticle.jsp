  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %> 
<%
  request.setCharacterEncoding("UTF-8");
%>
<%
  request.setCharacterEncoding("utf-8");
  pageContext.setAttribute("crcn", "\r\n");
  pageContext.setAttribute("br", "<br>"); 
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
 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(){
    	 location.href='${contextPath}/notice/listArticles.do';
	    //obj.action="${contextPath}/notice/listArticles.do";
	    //obj.submit();
     }
 
     function fn_modify(){
    	 document.getElementById("div_view_article").style.display='none';
		 document.getElementById("div_modify_form").style.display='block';
    	 
     }
     
	 function fn_enable(obj){
		 
		 /*
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
		 */
	 }
	 
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/notice/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>
     <c:choose>
	<c:when test="${article.id eq 'admin'}">
		<c:set var="writer" value="관리자" />
	</c:when>
	<c:otherwise>
		<c:set var="writer" value="${article.id}" />
	</c:otherwise>
</c:choose>

<div id="div_view_article" >
  <table  border=1  align="center">
  <tr>
   <td width=150 align="center">
      글번호
   </td>
   <td >
    <%-- <input type="text"  value="${article.articleNO }"  disabled /> --%>
    ${article.articleNO }
    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center">
      작성자
   </td>
   <td >
    <%-- <input type=text value="${article.id }" name="writer"  disabled /> --%>
    ${writer}
   </td>
  </tr>
  <tr>
    <td width="150" align="center">
      제목 
   </td>
   <td>
    <%-- <input type=text value="${article.title }"  name="title"  id="i_title" disabled /> --%>
    ${article.title }
   </td>   
  </tr>
  <tr>
    <td width="150" align="center">
      내용
   </td>
   <td>
    <%-- <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${article.content }</textarea> --%>
    ${fn:replace(article.content,crcn, br)}
   </td>  
  </tr>
 
<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
<tr>
    <td width="150" align="center" rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  /><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
      <!--  <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   /> -->
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width="150" align="center">
	      등록일자
	   </td>
	   <td>
	    <%-- <input type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled /> --%>
	    ${article.writeDate}
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
	   <td colspan="2"   align="center" >
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
           <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center">
	    <input type=button value="수정하기" onClick="fn_modify()">
	    <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/notice/removeArticle.do', ${article.articleNO})">
	    <input type=button value="리스트로 돌아가기"  onClick="backToList()">
	     <!--  <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/notice/replyForm.do', ${article.articleNO})">-->
   </td>
  </tr>
 </table>
</div>
 

<div id="div_modify_form" style="display:none;">
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center">
  <tr>
   <td width=150 align="center">
      글번호
   </td>
   <td >
    <input type="text"  value="${article.articleNO }"  disabled/>
    <input type="hidden" name="articleNO" value="${article.articleNO}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center">
      작성자
   </td>
   <td >
    <input type=text value="${writer}" name="writer" disabled/>
   </td>
  </tr>
  <tr>
    <td width="150" align="center">
      제목 
   </td>
   <td>
    <input type=text value="${article.title }"  name="title"  id="i_title" />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  />${article.content }</textarea>
   </td>  
  </tr>
 
<c:if test="${not empty article.imageFileName && article.imageFileName!='null' }">  
<tr>
    <td width="150" align="center" rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${article.imageFileName }" />
    <img src="${contextPath}/download.do?articleNO=${article.articleNO}&imageFileName=${article.imageFileName}" id="preview"  /><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <input  type="file"  name="imageFileName " id="i_imageFileName"     onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width="150" align="center">
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${article.writeDate}" />" disabled/>
	   </td>   
  </tr>
  <tr >
	   <td colspan="2"   align="center" >
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
         <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
 </table>
 </form>
 </div>

<jsp:include page="/footer.jsp"></jsp:include>