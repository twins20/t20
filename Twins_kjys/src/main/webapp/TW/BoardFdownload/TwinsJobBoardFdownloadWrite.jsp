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

<style>
	.fileDrop {
		width : 800px;
		height : 100px;
		border : 1px dotted blue;
	}
	
	small {
		margin-left : 3px;
		font-weight: bold;
		color : gray;
	}
	
</style>

<script type="text/javascript" src ="http://code.jquery.com/jquery-3.2.0.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/resources/plugins/jQuery/handlebars-v4.0.11.js"></script> 
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

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
	form0922.action="${pageContext.request.contextPath}/twins/jbfWriteActionController${pageMaker.jmidxTotalMakeSearch(page)}"; // 동일   

//    form0922.submit();
    return;
}

</script>

</head>
<body>

${ui.jmidx} / ${ui.jmid} / ${ui.jmname}님 반갑습니다.

<c:if test="${jbv.jmidx == null}">
  <c:set var="jmidx" value="${'7'}"/>	
</c:if>

<h1>자료실 글쓰기 화면입니다.</h1>
&nbsp;&nbsp;&nbsp;&nbsp;
<font color=blue>업로드할 화일을 끌어다 놓은 후 저장 및 전송 버튼을 누르세요.</font>  
<br>

<form name="form1" id="registerForm">

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
  						   onkeyup="checkLength(this,85)">${jbv.jbsubject}</textarea>
                 <strong id="NoteLen1">0</strong>/85자
                 <label for = "jbsubject" id ="lblName"></label>
   </td> 
</tr>

<tr>
  <td class=col1>내용&nbsp;&nbsp;&nbsp;&nbsp;</td>
  <td class=col2><textarea class=jbcontent name="jbcontent" cols=70 rows=7 
                           onkeyup="checkLength(this,500)">${jbv.jbcontent}</textarea>
                  <strong id="NoteLen2">0</strong>/500자
  </td>
</tr>

<tr>
  <td class=col1>작성자</td>
  <td class=col2><textarea class=jbwriter name="jbwriter" cols = 30 rows=1 
  						   onkeyup="checkLength(this,15)">${jbv.jbwriter}</textarea>
                 <strong id="NoteLen3">0</strong>/15자
  </td> 
</tr>

<tr>
  <td class=bottom colspan=2>
  
   <input id="registerButton" type="button" value="저장 및 전송">
   <input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(page)}'">  <!-- 동일 -->  
   <input type="button" value="새로고침" onclick="javascript:window.location.reload(true);">
   <input type="button" value="리셋" onclick="javascript:reset();">
   
  </td>
</tr>

</table>

<h3>
	업로드할 화일을 끌어다 놓고 전송 버튼을 누르세요.
</h3>
<div class = 'fileDrop'></div>

<div class = 'uploadedList'></div>
</form>

<script>
	
	function checkImageType(fileName){
	
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
	}
	
	function getOriginalName(fileName){
		
		if(checkImageType(fileName)){
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	}

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".uploadedList").on("click", ".delButton", function(event) {
	
		var that = $(this);
		
		$.ajax({
			url : "deleteFile",
			type : "post",
			data : {fileName:$(this).attr("data-src")},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					//alert("deleted");
					that.parent("div").remove();
				}
			}
		});
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
				
		var files = event.originalEvent.dataTransfer.files;
		var file = files[0];
		//console.log(file);
		var formData = new FormData();
		formData.append("file", file);
	
		$.ajax({
			url: 'uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data, index){
				
				//alert(data);
				
				var str = "";
				
				console.log(index);
				//console.log(data);
				//console.log(checkImageType(data));
				
				if (checkImageType(data)){
					str = "<div style='float:left; margin : 10px;'"
							+"class='item" + index + "'>"
							+ "<a href='displayFile?fileName="+getImageLink(data)+"'>"
							+"<img src='displayFile?fileName="+data+"'/>"
							+ "</a><small class='delButton' data-src="+data+">X</small>"
							+ "<small class='rightArrow' data-src=''> > </small>"
							+ "<small class='leftArrow' data-src=''> < </small></div>";
				}	
				else {
					str = "<div style='float:left; margin : 10px;'"
							+"class='item" + index + "'>"
							+ "<a href='displayFile?fileName="+data+"'>"
							+ getOriginalName(data)+"</a>"
							+"<small class='delButton' data-src="+data+">X</small>"
							+ "<small class='rightArrow' data-src=''> > </small>"
							+ "<small class='leftArrow' data-src=''> < </small></div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
	});	
</script>

<script>

	$("#registerButton").on("click", function(event) {
		
		event.preventDefault();
		
		check();
		
		var that = $("#registerForm")
		
		var str = "";
		
		$(".uploadedList").children().each(function(index){
			str += "<input type='hidden' name='files[" + index + "]' value='" 
				+ $(this).children().first().attr("href") + "'>";
		});
		
		that.append(str);
		
		that.get(0).submit();
		//that.submit();
	});

</script>

<script>

	$('.uploadedList').on("click", "div .leftArrow", function() {
		
		$(this).parent().insertBefore( $(this).parent().prev() );
	});
	
</script>

<script>

	$('.uploadedList').on("click", "div .rightArrow", function() {
		
		$(this).parent().insertAfter( $(this).parent().next() );
	});
	
</script>

</body>
</html>

