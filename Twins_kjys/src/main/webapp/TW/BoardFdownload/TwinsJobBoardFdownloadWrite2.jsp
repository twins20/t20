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
input.jbcontent{size:1000;width:450px}
input.jbwriter{size:20;width:500px}

.fileDrop {
width: 500px;
height: 100px;
border: 1px dotted gray;
background-color: lightslategray;
margin: auto;
}

</style>

<script type="text/javascript" src ="http://code.jquery.com/jquery-3.2.0.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<!--script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>  -->
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

<h1>자료실 글쓰기 화면입니다.</h1>
&nbsp;&nbsp;&nbsp;&nbsp;
<font color=blue>업로드할 화일을 끌어다 놓은 후 저장 및 전송 버튼을 누르세요.</font>  
<br>

<form name="form1">

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
  <td class=col2><textarea class=jbcontent name="jbcontent" cols=70 rows=10 
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
  
   <input type="button" value="저장 및 전송" onclick="check();">
   <input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(page)}'">  <!-- 동일 -->  
   <input type="button" value="새로고침" onclick="javascript:window.location.reload(true);">
   <input type="button" value="리셋" onclick="javascript:reset();">
   
  </td>
</tr>

</table>

<div>
	<div class="form-group">
		<label for="exampleInputEmail1">File Drop Here</label>
		<div class="fileDrop"></div>
	</div>
</div>

<!-- /.box-body -->

<div class="box-footer">
	<div>
		<hr>
	</div>

	<ul class="mailbox-attachments clearfix uploadedList">
	</ul>
	
	<button type="submit" class="btn btn-primary">Submit</button>
</div>

</form>

<script id="template" type="text/x-handlebars-template">
	<li>
		<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
			alt="Attachment"></span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i></a>
		</div>
	</li>
</script>

<script type="text/javascript" src="/resources/js/upload.js"></script>

<script>

	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {

		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;
		
		var file = file[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url: 'uploadAjax',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data){
				
				var fileInfo = getFileInfo(data);
				
				var html = template(fileInfo);
				
				$(".uploadedList").append(html);
			}
		});
	});
</script>

<script>

	$("#registerForm").submit(function(event) {
		
		event.preventDefault();

		var that = $(this);
		
		var str = "";
		
		$(".uploadedList .delbtn").each(function(index){
			str += "<input type='hidden' name='files[" + index + "]' value='" 
				+ $(this).attr("href") + "'>";
		});
		
		that.append(str);
		
		that.get(0).submit();
	});
</script>

</body>
</html>

