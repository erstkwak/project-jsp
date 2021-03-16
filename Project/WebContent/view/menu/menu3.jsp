<%@ page
		language="java"
		contentType="text/html; charset=utf-8"
		pageEncoding="utf-8"
		isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="/header.jsp"></jsp:include>
<!-- 페이지 소개 // -->
<section id="breadcrumbs" class="breadcrumbs">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h2>운동</h2>
      <ol>
        <li><a href="${contextPath}/">홈</a></li>
        <li>운동</li>
      </ol>
    </div>
  </div>
</section>
<!-- // 페이지 소개 -->

<div style="text-align: center">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	처음 운동을 시작하니
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	부위마다
	</p> 
	<p style="text-align:center; font-size:50px; color:red; font-size:50px; display:inline-block ">
	어떤 운동
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	을
	</p> 
	<p style="text-align:center; font-size:50px; color:red; font-size:50px; display:inline-block">
	올바른 자세
	</p>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	로 하는지 모르시겠죠?
	</p>
	<br>
	<p style="text-align:center; font-size:50px; font-size:50px; display:inline-block">
	저희가 도와드리겠습니다.
	</p>
	<p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<p style="text-align:center; font-size:30px">부위별 운동방법 궁금하시다면 부위를 클릭해주세요</p>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<a class="menu_1" style="text-align:center; font-size:40px" href="/view/menu/menu3_1.jsp">어깨</a>&emsp;&emsp;&emsp;
	<a class="menu_2" style="text-align:center; font-size:40px" href="/view/menu/menu3_2.jsp">가슴</a>&emsp;&emsp;&emsp;
	<a class="menu_3" style="text-align:center; font-size:40px" href="/view/menu/menu3_3.jsp">등</a>&emsp;&emsp;&emsp;
	<a class="menu_4" style="text-align:center; font-size:40px" href="/view/menu/menu3_4.jsp">이두·삼두</a>&emsp;&emsp;&emsp;
	<a class="menu_5" style="text-align:center; font-size:40px" href="/view/menu/menu3_5.jsp">하체</a>&emsp;&emsp;&emsp;
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</div>

<jsp:include page="/footer.jsp"></jsp:include>