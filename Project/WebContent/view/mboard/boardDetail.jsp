<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LIST_DETAIL</title>
<script>
	var httpRequest = null;

	// httpRequest 객체 생성
	function getXMLHttpRequest(){
	    var httpRequest = null;
	
	    if(window.ActiveXObject){
	        try{
	            httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
	        } catch(e) {
	            try{
	                httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
	            } catch (e2) { httpRequest = null; }
	        }
	    }
	    else if(window.XMLHttpRequest){
	        httpRequest = new window.XMLHttpRequest();
	    }
	    return httpRequest;    
	}
	
	// 댓글 등록
	function writeCmt()
	{
	    var form = document.getElementById("writeCommentForm");
	    
	    var board = form.comment_board.value
	    var id = form.comment_id.value
	    var content = form.comment_content.value;
	    
	    if(!content)
	    {
	        alert("내용을 입력하세요.");
	        return false;
	    }
	    else
	    {    
	        var param="comment_board="+board+"&comment_id="+id+"&comment_content="+content;
	            
	        httpRequest = getXMLHttpRequest();
	        httpRequest.onreadystatechange = checkFunc;
	        httpRequest.open("POST", "CommentWriteAction.co", true);    
	        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded;charset=EUC-KR'); 
	        httpRequest.send(param);
	    }
	}
	
	function checkFunc(){
	    if(httpRequest.readyState == 4){
	        // 결과값을 가져온다.
	        var resultText = httpRequest.responseText;
	        if(resultText == 1){ 
	            document.location.reload(); // 상세보기 창 새로고침
	        }
	    }
	}

</script>
</head>
<body>
	
	<div>
		<h3>HEALTH_BOARD_LIST_DETAIL</h3>
		<h3 class="hidden">게시판 내용</h3>
		<table>
			<tbody>
			
				<tr>
					<th>번호</th>
					<td colspan="3">${vo.id}</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td class="text-align-left text-indent text-strong text-orange" colspan="3">${vo.title }</td>
				</tr>
				
				<tr>
					<th>작성일</th>
					<td class="text-align-left text-indent" colspan="3">
					<fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${vo.regdate}"/>
					</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td>${vo.writer_id }</td>
				</tr>

				<tr>
					<th>조회수</th>
					<td><fmt:formatNumber type="number" pattern="#,#### 조회수" value="${vo.hit}" /></td>
				</tr>
				
				<tr>
					<th>첨부파일</th>
					<td colspan="3" style="text-align:left; text-indent:10px;">
					<c:forTokens var="fileName" items="${vo.files}" delims="," varStatus="st">
						<c:set var="style" value="" />
						<c:if test="${fn:endsWith(fileName, '.zip') }">
							<c:set var="style" value="font-weight:bold; color:red;"/>
						</c:if>
						<a href="${fileName}" style="${style}">${fn:toUpperCase(fileName) }</a>
						<c:if test="${!st.last}">
						/
						</c:if>
					</c:forTokens>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td colspan="4">${vo.content}</td>
				</tr>
				
			</tbody>
			
			<tr>
				<td colspan="5" align = "center">
					<a href="BoardModifyFormAction.do?id=${vo.id}">수정</a>
					<a href="BoardDeleteAction.do?id=${vo.id}">삭제</a>
					<a href="/Project/index.jsp">HOME</a>
					<a href="BoardListAction.do">목록</a>
				</td>
			</tr>
		</table>
	</div>
	
	
	
	
	 <!-- 댓글 부분 -->
    <div id="comment">
    
    <table border="1" bordercolor="lightgray">
    <!-- 댓글 목록 -->    
    <c:if test="${requestScope.commentList != null}">
        <c:forEach var="comment" items="${requestScope.commentList}">
            <tr>
                <!-- 아이디, 작성날짜 -->
                <td width="150">
                    <div>
                        ${comment.comment_id}<br>
                        <font size="2" color="lightgray">${comment.comment_date}</font>
                    </div>
                </td>
                <!-- 본문내용 -->
                <td width="550">
                    <div class="text_wrapper">
                        ${comment.comment_content}
                    </div>
                </td>
                <!-- 버튼 -->
                <td width="100">
                    <div id="btn" style="text-align:center;">
                        <a href="#">[답변]</a><br>
                 <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->    
                 <!--    <c:if test="${comment.comment_id == sessionScope.sessionID}">  -->
                        <a href="#">[수정]</a><br>    
                        <a href="#">[삭제]</a>
                   <!--  </c:if>  -->        
                    </div>
                </td>
            </tr>
            
        </c:forEach>
    </c:if>
    </table>
            
         <!-- 로그인 했을 경우만 댓글 작성가능 -->
         <table border="1" bordercolor="lightgray">
        <c:if test="${sessionScope.sessionID ==null}">
                    <tr bgcolor="#F5F5F5">
            	<form id="writeCommentForm">
            		<input type="hidden" name="comment_board" value="${vo.id}">
	           <!--     <input type="hidden" name="comment_id" value="${vo.writer_id}">  -->
	             	<!--<input type="hidden" name="comment_id" value="${sessionScope.sessionID}">-->  
	                <!-- 아이디-->
	                <td width="150">
	                    <div>
	                      <!--  ${sessionScope.sessionID}  --> 
	                      	<input type="text" name="comment_id" value="${vo.writer_id}" placeholder="작성자" />
	                    </div>
	                </td>
	                <!-- 본문 작성-->
	                <td width="550">
	                    <div>
	                        <textarea name="comment_content" rows="4" cols="70" ></textarea>
	                    </div>
	                </td>
	                <!-- 댓글 등록 버튼 -->
	                <td width="100">
	                    <div id="btn" style="text-align:center;">
	                        <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>
	                         
	                      <!--    <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>   -->  

	                    </div>
	                </td>
	                <td>
	                 <div id="div1">
	                 </div>
	                </td>
            	</form>
            </tr>
         </c:if>
    
        </table>
    </div>

	
	
</body>
</html>