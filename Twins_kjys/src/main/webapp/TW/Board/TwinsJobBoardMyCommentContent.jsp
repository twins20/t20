<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<c:if test="${!empty pageMaker.scri.keyword}">
	<c:set var="keywordd" value="${URLEncoder.encode(pageMaker.scri.keyword,'UTF-8') }" /> 
</c:if>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>

ul.content{
	
	list-style : none;
	margin : 10px;
	text-indent: 10em;
   }
   
ul.subject{
	list-style : none;
	margin : 10px;
	}
</style>

</head>

<body>
	
	<input type ="hidden" name = "jbidx" value ="${jbv.jbidx }">

		<h1>내가쓴 댓글 내역${jbcv.jmidx }</h1>
<div >
<c:set var = "jbidxbefore" value = '0'>
</c:set>
	
	<form name = "form" action="${pageContext.request.contextPath}/twins/jbMyCommentController">
	<input type ="hidden" name = "jmidx" value ="${jbcv.jmidx }">
	
	<select name='searchType'>
		<option value="jbsubject"
		<c:out value="${pageMaker.scri.searchType eq 'jbsubject'?'selected':''}"/>>
		제목</option>
		<option value="jbccontent"
		<c:out value="${pageMaker.scri.searchType eq 'jbccontent'?'selected':''}"/>>
		내용</option>
	</select>
	
	<input type="text" name='keyword' id="keywordInput" value='${pageMaker.scri.keyword}'>
		<button id='searchBtn'>검색</button> &nbsp;&nbsp;&nbsp;
	</form>
		
	<c:forEach items="${alist}" var="jbcv" > 
		<c:choose>
		 
			<c:when test = "${jbcv.jbidx != jbidxbefore}">
			<c:set var = "jbidxbefore" value="${jbcv.jbidx}">
			</c:set>	
		<ul class="subject">
			<li style="text-indent: 5em;">${jbcv.jbidx }번호${jbcv.jmidx }</li>
			<li style="text-indent: 5em;"><a title="내용보기" href="${pageContext.request.contextPath}/twins/jbContentController${pageMaker.jbidxJmidxTotalMakeSearch(pageMaker.scri.page, jbcv.jbidx)}">
			${jbcv.jbsubject }</a></li>
			<li style="text-indent: 10em;">${jbcv.jbccontent }</li>
		</ul>
			</c:when>
		
		<c:otherwise>
		
		<ul class="content" >		
			<li>${jbcv.jbccontent }</li>	
		</ul>
		
		</c:otherwise>
		</c:choose>
</c:forEach>
</div>

<div class="container">
 <div class="row">
   <div class="col-xs-12">
     <div class="jb-center">
       <ul class="pagination">
     
         <c:if test="${pageMaker.prev}">
           <li><a href="${pageContext.request.contextPath}/twins/jbMyCommentController${pageMaker.jmidxMakeSearch(pageMaker.startPage - 1)}">&laquo;</a> <!-- 동일 -->
           </li>
         </c:if>
         
         <c:forEach begin="${pageMaker.startPage}"
         	end="${pageMaker.endPage}" var="idx">
         
         		<li
         			<c:out value="${pageMaker.scri.page == idx?'class =active':''}"/>
         		>
         			<a href="${pageContext.request.contextPath}/twins/jbMyCommentController${pageMaker.jmidxMakeSearch(idx)}">${idx}</a> <!-- 동일 -->
         		</li>
         </c:forEach>
   
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
         	
       	   <li><a href="${pageContext.request.contextPath}/twins/jbMyCommentController${pageMaker.jmidxMakeSearch(pageMaker.endPage + 1)}">&raquo;</a>   <!-- 동일 -->    	
           </li>
         </c:if>
          
        </ul>
      </div>
    </div>
  </div>
</div>

</body>
</html>