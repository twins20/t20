<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style> 

table.table{width:800px;}

td.col1{width:100px; background-color:#B2EBF4; text-align:center}
td.col2{width:500px;}
td.bottom{text-align:center;}

input.jbsubject{size:100; width:500px}
input.jbcontent{size:1000;width:500px}
input.jbwriter{size:20;width:500px}

</style>

<script type="text/javascript">


function checkLength(f,n){
	
	var limit = n;
	var StrLen =f.value.length;
	if(StrLen > limit)
		
	{
		alert("내용은 "+limit+"자 까지만 입력이 가능합니다."); f.value=f.value.substring(0,limit);
		f.focus();
	}
	
	if ( f.name == "jbsubject") {
		document.getElementById("NoteLen1").innerHTML = f.value.length;
	} else if ( f.name == "jbcontent") {
		document.getElementById("NoteLen2").innerHTML = f.value.length;
	} else if (f.name == "jbwriter") {
		document.getElementById("NoteLen3").innerHTML = f.value.length;
	}
}
  
function check() {
	
	var form0922 = document.form1;
	if (form0922.jbsubject.value == "") {
		alert ('제목을 입력하세요.');
		form0922.jbsubject.focus();
		return false;
	}else if (form0922.jbcontent.value == "") {		
		alert ('내용을 입력하세요.');
		form0922.jbcontent.focus();
		return false;
	}else if (form0922.jbwriter.value == ""){
		alert ('작성자를 입력하세요.');
		form0922.jbwriter.focus();
		return false;
		}
	form0922.method="post";
    form0922.action="${pageContext.request.contextPath}/twins/jbReplyActionController${pageMaker.jbidxJmidxTotalMakeSearch(page, jbv.jbidx)}"; // 동일   
    form0922.submit();
    return;
}

</script>


</head>
<body>	

<!-- Insert 가 실패하면 0 반납  -->
    
<c:if test="${m.rds == '0' && isReply == 'Yes'}">

    <h1> m.rds = '0' </h1>
    
 <script type='text/javascript'>alert('답글 쓰기에 실패하였습니다.\n\n다시  입력하세요.');</script> 	  
    
</c:if>   
          
page = ${page}<br>   
jbidx = ${jbv.jbidx}<br>
totalPage = ${totalPage}
<p>pageMaker.scri.searchType = ${pageMaker.scri.searchType}</p> 
<p>pageMaker.scri.keyword = ${pageMaker.scri.keyword}</p> 
<p>jbv.jbcategory = ${jbv.jbcategory}</p> 
<p>pageMaker.scri.jbidx = ${pageMaker.scri.jbidx}</p> 
<p>pageMaker.scri.jbcategory = ${pageMaker.scri.jbcategory}</p> 
  
<p>${pageMaker.ui.jmidx} / ${pageMaker.ui.jmid} / ${pageMaker.ui.jmname}님 반갑습니다.</p> 
    
<h1>답글 쓰기 화면입니다.</h1>

<form name="form1">

<!-- 
<input type="hidden" name="jbidx" value="${jbv.jbidx}">
<input type="hidden" name="jbcategory" value="${jbv.jbcategory}">

<input type="hidden" name="jbwritedate" value="${jbv.jbwritedate}">
 -->
 
<input type="hidden" name="jboidx" value="${jbv.jboidx}">
<input type="hidden" name="jbupdown" value="${jbv.jbupdown}">
<input type="hidden" name="jbleftright" value="${jbv.jbleftright}">



<table class=table border=1>

<tr>
  <td class=col1>상태 바</td>
  <td  colspan = 3>${m.msg}</td>
</tr>

<tr>
  <td class=col1>원글번호</td>
  <td>${jbv.jboidx}</td>
  <td class=col1>원글제목</td>
  <td>${jbv.jbsubject}</td>
</tr>

<tr>
  <td class=col1>답글제목</td>
  <td class=col2 colspan=3><textarea class=jbsubject name="jbsubject" cols = 50 rows=1 
  						   onkeyup="checkLength(this,85)"></textarea>
                 <strong id="NoteLen1">0</strong>/85자
                 <label for = "jbsubject" id ="lblName"></label>
   </td>   
</tr>

<tr>
  <td class=col1>답글내용&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td class=col2 colspan=3><textarea class=jbcontent name="jbcontent" cols=70 rows=10 
                           onkeyup="checkLength(this,500)"></textarea>
                  <strong id="NoteLen2">0</strong>/500자
  </td>
</tr>

<tr>
  <td class=col1>작성자</td>
  <td class=col2 colspan=3><textarea class=jbwriter name="jbwriter" cols = 30 rows=1 
  						   onkeyup="checkLength(this,15)"></textarea>
                 <strong id="NoteLen3">0</strong>/15자
  </td>    
</tr>

<tr>
  <td class=bottom colspan=4>
  
   <input type="button" value="저장" onclick="check();">
   <input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(page)}'">  <!-- 동일 -->   
   <input type="button" value="새로고침" onclick="javascript:window.location.reload(true);">
   <input type="button" value="리셋" onclick="javascript:reset();">


  </td>
</tr>


</table>

</form>

</body>
</html>

