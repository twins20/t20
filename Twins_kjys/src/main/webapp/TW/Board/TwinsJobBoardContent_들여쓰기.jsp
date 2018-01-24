<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
table.mytable{width:1000px; height:360px;}
td.narrow {width:50px; height:20px; text-align:center; background-color:#B2EBF4;}
td.col1 {width:100px; height:20px; text-align:center; background-color:#B2EBF4;}
td.title {width:350px; height:20px;}
td.short {height:20px}
td.aligncenter {width:100px; text-align:center; background-color:#B2EBF4;}
td.col2 {width:100px;text-align:center;}

</style>

<style>

	#modDiv {
		width : 650px;
		height : 100px;
		background-color : gray;
		position : absolute;
		top : 80%;
		left : 49%;
		margin-top : -50px;
		margin-left : -150px;
		padding : 10px;
		z-index : 1000;
	}
	
	.fdownloadLi { 
		list-style : none;
		float : left;
		margin : 10px;
	}
	
	.replyLi { 
		list-style : none;
		margin : 10px;
	}
	
	#repliesDiv { 
		list-style : none;
		margin : 10px;
	}
	
	.uploadedListOpenCloseBtn {
    background-color:#1270AB; /* Blue */
    border: none;
    color: white;
    padding: 8px 17px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
   }
   
   	#btnToggle {
    background-color:#1270AB; /* Blue */
    border: none;
    color: white;
    padding: 7px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    border-radius: 4px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
   }
   
   .uploadedListOpenCloseBtn:hover {
    background-color: #005899;
    color: white;
	}
   
	#btnToggle:hover {
    background-color: #005899;
    color: white;
	}
	
</style>

<script type="text/javascript" src ="http://code.jquery.com/jquery-3.2.0.min.js"></script>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="/resources/plugins/jQuery/handlebars-v4.0.11.js"></script>

<script type="text/javascript">

// window.onload = function(){

//	getAllUploadedFiles();
// }

 function DeleteYN(){
	 	 
	 var rep = confirm("정말 삭제하시겠습니까?");
	 
	 	 
	 if (rep == true) {
		 
		 window.document.location.href=
			 '${pageContext.request.contextPath}/twins/jbDeleteActionController${pageMaker.jbidxJmidxMakeSearch(page, jbv.jbidx)}'; // 동일   

	 } else {
		 alert("삭제가 취소되었습니다.")
	 }
	  
 }
 
 function check() {
		
	if ( $("#newReplyWriter").val() == "" ) {
		alert ('작성자를 입력하세요.');
		$("#newReplyWriter").focus();
		return false;
	}else if ( $("#newReplyText").val() == "" ) {
		alert ('내용을 입력하세요.');
		$("#newReplyText").focus();
		return false;
	}
	return;
}

</script>

</head>
<body>

<!-- 
totalPage = ${totalPage}<br>
pageMaker.totalPage = ${pageMaker.totalPage}

<p>pageMaker.scri.searchType = ${pageMaker.scri.searchType}</p> 
<p>pageMaker.scri.keyword = ${pageMaker.scri.keyword}</p> 
<p>pageMaker.scri.jbidx = ${pageMaker.scri.jbidx}</p> 
 -->
<p>pageMaker.scri.jbcategory = ${pageMaker.scri.jbcategory}</p> 

<p>${ui.jmidx} / ${ui.jmid} / ${ui.jmname}님 반갑습니다.</p> 

<h1>  내용보기 화면입니다. </h1>

<input type="hidden" name="searchType" value="${pageMaker.scri.searchType}">
<input type="hidden" name="keyword" value="${pageMaker.scri.keyword}">

<input type="hidden" name="jboriginbidx" value="${jbv.jboidx}">
<input type="hidden" name="jbupdown" value="${jbv.jbupdown}">
<input type="hidden" name="jbleftright" value="${jbv.jbleftright}">

<c:if test="${jbv == null }">
	<script type='text/javascript'>alert('처음부터 시작하세요.');</script>
	<script type='text/javascript'>	
	     window.document.location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxSend()}';</script> <!-- 동일 -->   
	     <!-- window.document.location.href='${pageContext.request.contextPath}/Spring/MVCListcontroller_TS${mv.sendLoginInfo(mv.idx, mv.name)}'; -->
</c:if>	   


<!--  // 이 부분은 jbds.getJobBoardContent()함수가 query 실패시 jbv.jbidx에 0을 담아서 보내기 때문임  -->
<c:if test="${jbv.jbidx == 0 }">
   <script type='text/javascript'>alert('데이터를 가져오지 못했습니다.\n\n다시 시도하세요.');</script>
   <script type='text/javascript'>	
	    window.document.location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(page)}';</script> <!-- 동일 -->   
</c:if>

<table border=1 class="mytable">

		<tr>
		  <td class=col1>상태 바</td>
		  <td colspan=9>${m.msg}</td>
		</tr>

        <tr>
         <td class="col1">번호</td><td class="col2" align="center">${jbv.jbidx}</td>
         <td class="narrow">제목</td><td class="title">${jbv.jbsubject}</td>
         <td class="narrow">작성자</td><td class="col2">${jbv.jbwriter}</td>
         <td class="narrow">등록일</td><td class="col2">${jbv.jbwritedate}</td> 
         <td class="narrow">수정일</td><td class="col2">${jbv.jbmodifydate}</td> 
        </tr>

        <tr>
         <td class="aligncenter">내용</td><td colspan=9>${jbv.jbcontent}</td>
        </tr>
        
        <tr>
		  <td class=col1>첨부파일 목록<br>
		  	<button class="uploadedListOpenCloseBtn"> 닫기(보기) </button> </td>
		  <td class="clickHere2" colspan=9> 
		  	<!--  <p class="clickHere"> &nbsp; &nbsp; 첨부파일 목록을 보려면 이글을 클릭하세요. </p>  -->
		    <ul class="uploadedList"> 
		    	<li class="fdownloadLi">
					<span class="bg-green">
					 	첨부파일을 보려면 이 글을 클릭하세요. 
					</span>
				</li>
			</ul> </td>
		</tr>

       </table>

        <p class="short" align=center>
          <input type="button" name="modify" value="수정" onclick="location.href='${pageContext.request.contextPath}/twins/jbModifyController${pageMaker.jbidxJmidxMakeSearch(page, jbv.jbidx)}'"> <!-- 동일 -->   
          <input type="button" name="delete" value="삭제" onclick="DeleteYN();">
         
          <c:if test="${m.rds == '1' && m.isUpdate == 'Yes'}"> 
          	<input type="button" name="list" value="목록1" onclick="location.href='${pageContext.request.contextPath}/twins/jbListController_rm${pageMaker.jbidxJmidxMakeSearch(page, jbv.jbidx)}'"> <!-- 동일 -->    
          </c:if>
     
          
          <c:if test="${ ! (m.rds == '1' && m.isUpdate == 'Yes') }">
          <input type="button" name="list" value="목록0" onclick="location.href='${pageContext.request.contextPath}/twins/jbListController${pageMaker.jmidxMakeSearch(page)}'"> <!-- 동일 -->   
          </c:if>
          
          <input type="button" name="reply" value="답글쓰기" onclick="location.href='${pageContext.request.contextPath}/twins/jbReplyController${pageMaker.jbidxJmidxTotalMakeSearch(page, jbv.jbidx)}'"> <!-- 동일 -->   
         </p>

<script>

var jbidx = ${jbv.jbidx};  // 3;
var replyPage = 1;

</script> 

<div class="row">

	<div class="col-md-12">
	
		<div class="box box-success">
			<div class="box-body">
				<label for="newReplyWriter">&nbsp; &nbsp; 댓글 작성자</label>
					<input class="form-control" type="text" maxlength="15" 
						placeholder="댓글 작성자(최대 15자)" id="newReplyWriter"> 
				<label for="newReplyText">&nbsp; &nbsp; 내 용</label>
					<input class="form-control" type="text" maxlength="85"  
						placeholder="내 용(최대 85자)" id="newReplyText">
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button type="submit" class="btn btn-primary" id="replyAddBtn">
					댓글 저장
				</button>
				<button type="button" id="btnToggle" name="btnToggle"> 
					닫기(보기) 
				</button>
			</div>
		</div>

				
	</div>
	
	<div>
		<!-- The time line -->
		<ul class="timeline">
			<!-- timeline time label -->
			<li class="time-label" id="repliesDiv"> 
				<span class="bg-green">
					댓글 목록  --> 댓글을 보려면 이 글을 클릭하세요. 
				</span>
			</li>
		</ul>	
	</div>
	
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>	
	</div>
 			
</div>

<script>

	$("#replyAddBtn").on("click", function() {
	
		check();
		
		var jbcidx = 42;  // 42는 의미 없음. Controller에서 Max함수를 이용한 query를 호출하여
		var jbcupdown = 1;  		  //  Max(jbcdix) 값을 지정함
		var jbcleftright = 1;
		var jbccontent = $("#newReplyText").val();		
		var jbcwriter = $("#newReplyWriter").val();
		var jbcwritedate = "18/01/14";  //의미 없음. 콘트롤러에서 시스템 날자를 입력함
		var jbidx = ${jbv.jbidx};
		var jmidx = ${jbv.jmidx};
		
		$.ajax({
			type : 'post',
			url : '/replies',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				jbcidx : jbcidx,
				jbcupdown : jbcupdown,
				jbcleftright : jbcleftright,
				jbccontent : jbccontent,
				jbcwriter : jbcwriter,
				jbcwritedate : jbcwriter,
				jbidx : jbidx,
				jmidx : jmidx
			}),
			success : function(result) {
			
				if (result == 'SUCCESS') {
					
					alert("등록 되었습니다.");
					//getAllList();
					getPageList(1);
					
					//replyPage = 1;
					//getPage("/replies/" + jbidx + "/" + replyPage);
					$("#newReplyText").val("");
					$("#newReplyWriter").val("");
				}
			}
		});
	});
	
</script>	

<script>

function printPaging(pageMaker){
	
	var str = "";
	
	if(pageMaker.prev){
		str += "<li><a href='" + (pageMaker.startPage - 1) + "'> &laquo; </a></li>";
	}
	for(var i=pageMaker.startPage, len = pageMaker.endPage; i <= len; i++){
		var strClass = pageMaker.scri.page == i ? 'class = active' : '';
		str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
	}
	if(pageMaker.next){
		str += "<li><a href='" + (pageMaker.endPage + 1) + "'> &raquo; </a></li>";
	}
	
	$(".pagination").html(str);
}

</script>  

<script>

	function getAllList() {
		
//		var jbidx = ${jbv.jbidx};
	
		$.getJSON("/replies/all/" + jbidx, function(data){
			
			var str="";
//			console.log(data.length);
			
			$(data).each(
					function() {
						str += "<c:forEach items='${list}' var='lr' end='${jbcv.jbcleftright}' varStatus='status'>&nbsp;&nbsp;&n</c:forEach>"
				          		+"<li data-jbcidx='" + this.jbcidx 
						        + "' data-jbccontent='" + this.jbccontent
						        + "' data-jbcwriter='" + this.jbcwriter
						        +"' class='replyLi'>"
							+ this.jbcidx + " : " + this.jbccontent
							+ " : " + this.jbcwriter
							+ " <button>MOD</button></li>";
					});
			$("#repliesDiv").html(str);
		});
	}
	
</script>	

<script>

	function getPageList(page) {
	
//		var jbidx = ${jbv.jbidx};
		
		$.getJSON("/replies/" + jbidx + "/" + page, function(data){
			
			var str="";
			
//			console.log(data.list.length);
			
			$(data.list).each(
					function() {
						str += 
									"<li data-jbcidx='" + this.jbcidx 
						        + "' data-jbccontent='" + this.jbccontent
						        + "' data-jbcwriter='" + this.jbcwriter
						        +"' class='replyLi'>"
						        + "<c:forEach items="
								+$(this).parent()+" var='jbcv' end='${jbcv.jbcleftright}' varStatus='status'>&nbsp;&nbsp;</c:forEach>"
								+ "☞"+this.jbcidx + " : " + this.jbccontent
								+ " : " + this.jbcwriter
								+ " <button> 수정 </button><button class='comBtn'>댓글</button></li>";
							
					});	
			$("#repliesDiv").html(str);
			
			printPaging(data.pageMaker);
		});		
		
		//getAllUploadedFiles();
	}
	
</script>		 

<script>

	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		//getPage("/replies/" + jbidx + "/" + replyPage);
		getPageList(replyPage);
	});
	
</script>

<script>

	$("#repliesDiv").on("click", function() {
		
		if ($(".timeline li").size() > 1) {
			return;
		}
		//getPage("/replies/" + jbidx + "/1");
		getPageList(1);
	});
	
	$(".clickHere2").on("click", function() {
		
		if ($(".uploadedList li").size() > 1) {
			return;
		}
		getAllUploadedFiles();
	});
	
</script>

<script>	
	
	$("#repliesDiv").on("click", ".replyLi button", function() {
		
		var reply = $(this).parent();
		
		var jbcidx = reply.attr("data-jbcidx");
		var jbccontent = reply.attr("data-jbccontent");
		var jbcwriter = reply.attr("data-jbcwriter");
		
		// alert(jbcidx + " : " + jbccontent + " : " + jbcwriter);
		
		$(".modal-title").html(jbcidx);
		$("#jbccontent").val(jbccontent);
		$("#jbcwriter").val(jbcwriter);
		$("#modDiv").show("slow");
	});
		
</script>	 

<div id='modDiv' style="display: none;">
	<div class='modal-title'></div>
	<div>
		<input type='text' id='jbcwriter' style='width:630px' maxlength="15">
		<input type='text' id='jbccontent' style='width:630px' maxlength="85">		
	</div>
	<div>
		<button type="button" id="replyModBtn"> 수정 </button>
		<button type="button" id="replyDelBtn"> 삭제 </button>
		<button type="button" id="comBtn">댓글</button>
		<button type="button" id="closeBtn"> 닫기 </button>			
	</div>
</div>

<script>

	$("#replyDelBtn").on("click", function() {
	
		var jbcidx = $(".modal-title").html();
		
		$.ajax({
			type : 'delete',
			url : '/replies/' + jbcidx,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : 'text',
			success : function(result) {
				
//				console.log("result : " + result);

				if (result == 'SUCCESS') {
					
					alert("삭제 되었습니다.");
					$("#modDiv").hide("slow");
					//getAllList();
					getPageList(replyPage);
				}
			}
		});
	});
	
</script>

<script>

	$("#replyModBtn").on("click", function() {
	
		var jbcidx = $(".modal-title").html();
		var jbccontent = $("#jbccontent").val();	
		var jbcwriter = $("#jbcwriter").val();
		
		$.ajax({
			type : 'put',
			url : '/replies/' + jbcidx,
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify({
				jbccontent : jbccontent,
				jbcwriter : jbcwriter
			}),
			dataType : 'text',
			success : function(result) {
				
//				console.log("result : " + result);

				if (result == 'SUCCESS') {
					
					alert("수정 되었습니다.");
					$("#modDiv").hide("slow");
					//getAllList();
					getPageList(replyPage);
				}
			}
		});
	});
	
</script>

<script>
	$("#comBtn").on("click",function(){
	
		var jbcidx = 42;  // 42는 의미 없음. Controller에서 Max함수를 이용한 query를 호출하여
		var jbcupdown = 1;  		  //  Max(jbcdix) 값을 지정함
		var jbcleftright = 1;
		var jbccontent = $("#jbcwriter").val();		
		var jbcwriter = $("#jbccontent").val();
		var jbcwritedate = "18/01/14";  //의미 없음. 콘트롤러에서 시스템 날자를 입력함
		var jbidx = ${jbv.jbidx};
		var jmidx = ${jbv.jmidx};
		
		$.ajax({
			type : 'post',
			url : '/replies/replay',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				jbcidx : jbcidx,
				jbcupdown : jbcupdown,
				jbcleftright : jbcleftright,
				jbccontent : jbccontent,
				jbcwriter : jbcwriter,
				jbcwritedate : jbcwriter,
				jbidx : jbidx,
				jmidx : jmidx
			}),
			success : function(result) {
			
				if (result == 'SUCCESS') {
					
					alert("등록 되었습니다.");
					//getAllList();
					getPageList(1);
					
					//replyPage = 1;
					//getPage("/replies/" + jbidx + "/" + replyPage);
					$("#jbcwriter").val("");
					$("#jbccontent").val("");
				}
			}
		});
	});
</script>

<script>

	$("#closeBtn").on("click", function() {
	
		$(this).parent().parent().css('display', 'none');
	});
	
	$("#btnToggle").on("click", function() {
		
		$(".timeline").toggle();	 
	});
	
	$(".uploadedListOpenCloseBtn").on("click", function() {
		
		$(".uploadedList").toggle();	 
	});
	
//	$(".clickHere").on("click", function() {
		
//		getAllUploadedFiles();	 
//	});
	
	
</script>

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
	
	function getThumnail(fileName){
		if(!checkImageType(fileName)){
			return;
		}
		var front = fileName.substr(0,33);
		var end = fileName.substr(33);
		
		return front + "s_" + end;
	}

	function getAllUploadedFiles() {
		
//		var jbidx = ${jbv.jbidx};
	
		$.getJSON("/twins/jbfContentController/" + jbidx, function(data){
			
			var str="";
			console.log(data.length);
			
			$(data).each(
					function() {
						if(!checkImageType(this.jbfname)){
							
							str += "<li data-jbfidx='" + this.jbfidx 
							        + "' data-jbfname='" + this.jbfname
							        + "' data-jbfsort='" + this.jbfsort
							        +"' class='fdownloadLi'>"
						//			+ this.jbfidx + " : " 
									+ "<a href='" + this.jbfname + "'>" 
									+ "<img src='displayFile?fileName=/dist/img/file.jpeg'</a></li>";
						//			+ " : " + this.jbfsort + "</li>";
						} else {
						
							str += "<li data-jbfidx='" + this.jbfidx 
							        + "' data-jbfname='" + this.jbfname
							        + "' data-jbfsort='" + this.jbfsort
							        +"' class='fdownloadLi'>"
						//			+ this.jbfidx + " : " 
									+ "<a href='" + this.jbfname + "'>" 
						
						//			+ getOriginalName(this.jbfname) + "</a>"
									
									+ "<img src='" + getThumnail(this.jbfname) + "'></a></li>"
						//			+ " : " + this.jbfsort + "</li>";
						
						}	
					});
			$(".uploadedList").html(str);
		});
	}
	
</script>
</body>
</html>

