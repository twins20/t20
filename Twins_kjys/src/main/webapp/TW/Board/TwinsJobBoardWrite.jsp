<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style> 

table.table{width:800px;}

td.col1{width:100px; background-color:#B2EBF4; text-align:center}
td.col2{width:500px;}
td.bottom{text-align:center;}

input.jbsubject{size:100; width:500px}
input.jbcontent{size:1000;width:450px}
input.jbwriter{size:20;width:500px}

</style>

<script type="text/javascript">


function checkLength(f,n){
	
	var limit = n;
	var StrLen =f.value.length;
	
	if(StrLen > limit)
	{
	  alert("내용은 "+limit+"자 까지만 입력이 가능합니다.");
	  f.value=f.value.substring(0,limit);
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
	form0922.action="${pageContext.request.contextPath}/twins/jbWriteActionController${pageMaker.jmidxTotalMakeSearch(page)}"; // 동일   

    form0922.submit();
    return;
}

</script>

</head>
<body>

${ui.jmidx} / ${ui.jmid} / ${ui.jmname}님 반갑습니다.

<c:if test="${jbv.jmidx == null}">
  <c:set var="jmidx" value="${'7'}"/>	
</c:if>

<h1>글쓰기 화면입니다.</h1>
&nbsp;&nbsp;&nbsp;&nbsp;
<font color=blue>게시판을 선택한 후 저장버튼을 누르세요.</font>  
<br>

<form name="form1">


<input type = 'radio' name='jbcategory' value='n'
	<c:out value="${pageMaker.scri.jbcategory == 'n' ? 'checked' : '' }"/>
> 공지사항 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='f'
	<c:out value="${pageMaker.scri.jbcategory == 'f' ? 'checked' : '' }"/>
> 자유게시판 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='c'
	<c:out value="${pageMaker.scri.jbcategory == 'c' ? 'checked' : '' }"/>
> 회사정보 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='r'
	<c:out value="${pageMaker.scri.jbcategory == 'r' ? 'checked' : '' }"/>
> 취업정보 &nbsp;&nbsp;&nbsp;

<input type = 'radio' name='jbcategory' value='d'
	<c:out value="${pageMaker.scri.jbcategory == 'd' ? 'checked' : '' }"/>
> 자료실   &nbsp;&nbsp;&nbsp;



<input type="hidden" name="jmidx" value="${ui.jmidx}">

<input type="hidden" name="jboidx" value="0">  <!--  getJobBoardMaxIdx()에서 실제값을 할당함 /jbidx/ --> 
<input type="hidden" name="jbupdown" value="0">      <!--  답글이 아닌 글은 0을 줌 --> 
<input type="hidden" name="jbleftright" value="0">   <!--  답글이 아닌 글은 0을 줌 --> 

<!--  
<input type="hidden" name="RD" value="0">
-->

<table class=table border=1>

<tr>
  <td class=col1>상태 바</td>
  <td class=col2>${m.msg}</td>
</tr>

<tr>

  <td class=col1>제목</td>
  <td class=col2><textarea class=jbsubject name="jbsubject" cols = 50 rows=1 
  						   onkeyup="checkLength(this,85)"></textarea>
                 <strong id="NoteLen1">0</strong>/85자
                 <label for = "jbsubject" id ="lblName"></label>
   </td> 
</tr>

<tr>
  <td class=col1>내용&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td class=col2><textarea class=jbcontent name="jbcontent" cols=70 rows=7 
                           onkeyup="checkLength(this,500)"></textarea>
                  <strong id="NoteLen2">0</strong>/500자
  </td>
</tr>

<tr>
  <td class=col1>작성자</td>
  <td class=col2><textarea class=jbwriter name="jbwriter" cols = 30 rows=1 
  						   onkeyup="checkLength(this,15)">${ui.jmname}</textarea>
                 <strong id="NoteLen3">0</strong>/15자
  </td> 
</tr>

<tr>
  <td class=bottom colspan=2>
  
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

