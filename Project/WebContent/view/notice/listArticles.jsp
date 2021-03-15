<%@ page 
		language="java"
		contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>    

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<c:set var="articlesList" value="${articlesMap.articlesList}"        />
<c:set var="totArticles"  value="${articlesMap.totArticles}"         />
<c:set var="section"      value="${articlesMap.section}"             />
<c:set var="pageNum"      value="${articlesMap.pageNum}"             />
<c:set var="noticeList"   value="${articlesMap.noticeArticlesList}"  />

<%
  request.setCharacterEncoding("utf-8");
%>  

<jsp:include page="/header.jsp"></jsp:include>

<style>
  a {color: black;}
  .cls1 {text-decoration:none;}
  .cls2 {text-align:center; font-size:30px;}
  .no-uline {text-decoration:none;}
  .sel-page {text-decoration:none;}
 </style>

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

<br>

<section id="contact" class="contact">
	<div class="container">
		<div class="row justify-content-center" data-aos="fade-up">
				
				<table class="table" align="center" border="1"  width="80%"  >
  <thead class="thead-light">
  <tr height="10" align="center">
     <th scope="cols">번호</th>
     <th scope="cols">제목</th>
     <th scope="cols">작성자</th>              
     <th scope="cols">작성일</th>
  </tr>
  </thead>
<c:choose>
  <c:when test="${articlesList ==null }" >
    <tr  height="10" >
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${articlesList !=null }" >
  <tr align="center">
    
    <c:forEach  var="article" items="${noticeList }" varStatus="articleNum" >
    
    <c:choose>
	<c:when test="${article.id eq 'admin'}">
		<c:set var="writer" value="관리자" />
	</c:when>
	<c:otherwise>
		<c:set var="writer" value="${article.id}" />
	</c:otherwise>
</c:choose>
    
     <tr align="center" style="font-weight: bold;">
	 <!-- 
	   <td width="5%">${articleNum.count}</td>
	 -->
	<td width="5%">공지</td>
	<td align='left'  width="35%">
	    <span style="padding-right:30px"></span>    
	   <c:choose>
	      <c:when test='${article.level > 1 }'>  
	         <c:forEach begin="1" end="${article.level }" step="1">
	             <span style="padding-left:10px"></span> 
	         </c:forEach>
	         <span style="font-size:12px;"><img  src="${contextPath }/image/ico_re.gif" /></span>
                   <a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	          </c:when>
	          <c:otherwise>
	            <c:choose>
	              <c:when test="${article.newArticle ==true }">
	            	<a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
	            	 <img  src="${contextPath }/images/ico_new.gif" />
	              </c:when>
	              <c:otherwise>
	                <a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
	              </c:otherwise>
	            </c:choose>
	          </c:otherwise>
	        </c:choose>
	  </td>
	<td width="10%">${writer}</td>
	  <td  width="10%"><fmt:formatDate value="${article.writeDate}" /></td> 
	</tr>
	</c:forEach>	
	
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center">
     
     <c:choose>
	<c:when test="${article.id eq 'admin'}">
		<c:set var="writer" value="관리자" />
	</c:when>
	<c:otherwise>
		<c:set var="writer" value="${article.id}" />
	</c:otherwise>
</c:choose>
     
	<td width="5%">${article.articleNO}</td>
	<td align='left'  width="35%">
	    <span style="padding-right:30px"></span>    
	   <c:choose>
	      <c:when test='${article.level > 1 }'>  
	         <c:forEach begin="1" end="${article.level }" step="1">
	             <span style="padding-left:10px"></span> 
	         </c:forEach>
	         <span style="font-size:12px;"><img  src="${contextPath }/image/ico_re.gif" /></span>
                   <a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a>
	          </c:when>
	          <c:otherwise>
	            <c:choose>
	              <c:when test="${article.newArticle ==true}">
	            	<a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
	            	 <img  src="${contextPath }/images/ico_new.gif" />
	              </c:when>
	              <c:otherwise>
	                <a class='cls1' href="${contextPath}/notice/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a>
	              </c:otherwise>
	            </c:choose>
	          </c:otherwise>
	        </c:choose>
	  </td>
	<td width="10%">${writer}</td>
	  <td  width="10%"><fmt:formatDate value="${article.writeDate}" /></td> 
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>

<div class="cls2">
 <c:if test="${totArticles != null }" >
      <c:choose>
        <c:when test="${totArticles > 100 }">  <!-- 글 개수가 100 초과인경우 -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	         <c:if test="${section >1 && page==1 }">
	          <a class="no-uline" href="${contextPath }/notice/listArticles.do?section=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; pre </a>
	         </c:if>
	          <a class="no-uline" href="${contextPath }/notice/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
	         <c:if test="${page == 10 }">
	          <a class="no-uline" href="${contextPath }/notice/listArticles.do?section=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
	         </c:if>
	      </c:forEach>
        </c:when>
        <c:when test="${totArticles == 100 }" >  <!--등록된 글 개수가 100개인경우  -->
	      <c:forEach   var="page" begin="1" end="10" step="1" >
	        <a class="no-uline"  href="#">${page } </a>
	      </c:forEach>
        </c:when>
        
        <c:when test="${totArticles < 100 }" >   <!--등록된 글 개수가 100개 미만인 경우  -->
	      <c:forEach   var="page" begin="1" end="${totArticles/10 + 1}" step="1" >
	         <c:choose>
	           <c:when test="${page == pageNum }">
	            <a class="sel-page"  href="${contextPath }/notice/listArticles.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:when>
	          <c:otherwise>
	            <a class="no-uline"  href="${contextPath }/notice/listArticles.do?section=${section}&pageNum=${page}">${page } </a>
	          </c:otherwise>
	        </c:choose>
	      </c:forEach>
        </c:when>
      </c:choose>
    </c:if>
</div>    
<br><br>

  <c:choose>
  	<c:when test="${sessionScope.login_id eq 'admin'}">
		<a class="cls1"  href="${contextPath}/notice/articleForm.do"><p class="cls2">글쓰기</p></a>
  	</c:when>
  </c:choose>

</div>
			

		</div>
	</div>
</section>







<jsp:include page="/footer.jsp"></jsp:include>