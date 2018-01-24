<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
<style>
table.mytable{width:1000px; height:240px;}
td.narrow {width:50px; height:20px; text-align:center; background-color:#B2EBF4;}
td.col1 {width:100px; height:20px; text-align:center; background-color:#B2EBF4;}
td.title {width:350px; height:20px;}
td.short {height:20px}
td.aligncenter {width:100px; text-align:center; background-color:#B2EBF4;}
td.col2 {width:100px;text-align:center;}

</style>

<style>

	#modDiv {
		width : 300px;
		height : 100px;
		background-color : gray;
		position : absolute;
		top : 80%;
		left : 50%;
		margin-top : -50px;
		margin-left : -150px;
		padding : 10px;
		z-index : 1000;
	}

</style>


<!-- jQuery 2.1.4 -->
<script src ="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>  

<script type="text/javascript">

 function DeleteYN(){
	 	 
	 var rep = confirm("정말 삭제하시겠습니까?");
	 
	 	 
	 if (rep == true) {
		 
		 window.document.location.href=
			 '${pageContext.request.contextPath}/twins/jbDeleteActionController${pageMaker.jbidxJmidxMakeSearch(page, jbv.jbidx)}'; // 동일   

	 } else {
		 alert("삭제가 취소되었습니다.")
	 }
	  
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
  
        
<script type="text/javascript">
 
  function DeleteYN(){
	 
	 var rep = confirm("정말 삭제하시겠습니까?");
	  	 
	 if (rep == true) {
		 alert("삭제되었습니다.")

	 } else {
		 alert("삭제가 취소되었습니다.")
	 }	  
  }
</script>

<!-- jQuery 2.1.4 -->
<script src ="/resources/plugins/jQuery/jQuery-2.1.4.min.js">
</script>

<!-- 
<script
 		src="https://code.jquery.com/jquery-2.1.4.js"
 		integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4="
		crossorigin="anonymous">
</script>
-->   
 
<div>
	<div>
		JBCContent <input type='text' name='jbccontent' id='newReplyText'>	
	</div>
	<div>
		JBCWriter <input type='text' name='jbcwriter' id='newReplyWriter'">
	</div>
	
	<!--  
	<div>
		JBidx <input type='text' name='jbidx' id='jbidxNumber'>	
	</div>
	<div>
		JMidx <input type='text' name='jmidx' id='jmidxNumber'>	
	</div>
	-->
	
	<button id="replyAddBtn"> Add Reply </button>
</div>

<script>

	$("#replyAddBtn").on("click", function() {
	
		var jbcidx = 42;  // 42는 의미 없음. Controller에서 Max함수를 이용한 query를 호출하여
		var jbcupdown = 1;  		  //  Max(jbcdix) 값을 지정함
		var jbcleftright = 1;
		var jbccontent = $("#newReplyText").val();		
		var jbcwriter = $("#newReplyWriter").val();
		var jbcwritedate = "18/01/14";
		var jbidx = 3;
		var jmidx = 3;
		
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
				}
			}
		});
	});
	
</script>		 
 
<div>
	<ul id="replies">
	</ul>
	
	<ul class='pagination'>
	</ul>
</div>

<script>

	var replyPage = 1;

	$(".pagination").on("click", "li a", function(event) {
	
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPageList(replyPage);
	});
	
</script>

<script>

	function getAllList() {
		
		var jbidx = 3;
	
		$.getJSON("/replies/all/" + jbidx, function(data){
			
			var str="";
//			console.log(data.length);
			
			$(data).each(
					function() {
						str += "<li data-jbcidx='" + this.jbcidx 
						        + "' data-jbccontent='" + this.jbccontent
						        + "' data-jbcwriter='" + this.jbcwriter
						        +"' class='replyLi'>"
							+ this.jbcidx + ":" + this.jbccontent
							+ ":" + this.jbcwriter
							+ "<button>MOD</button></li>";
					});
			$("#replies").html(str);
		});
	}
	
</script>	

<script>

	function getPageList(page) {
	
		var jbidx = 3;
		
		$.getJSON("/replies/" + jbidx + "/" + page, function(data){
			
			var str="";
			
//			console.log(data.list.length);
			
			$(data.list).each(
					function() {
						str += "<li data-jbcidx='" + this.jbcidx 
						        + "' data-jbccontent='" + this.jbccontent
						        + "' data-jbcwriter='" + this.jbcwriter
						        +"' class='replyLi'>"
							+ this.jbcidx + ":" + this.jbccontent
							+ ":" + this.jbcwriter
							+ "<button> MOD </button></li>";
					});
			$("#replies").html(str);
			
			printPaging(data.pageMaker);
		});
	}
	
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
		$('.pagination').html(str);
	}
	
</script>	
	
<script>	
	
	$("#replies").on("click", ".replyLi button", function() {
		
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

<input type="button" value="삭제" onclick="DeleteYN();">
<input type="button" value="getAllList" onclick="getAllList();">
<input type="button" value="getPageList(1)" onclick="getPageList(1);">

<div id='modDiv' style="display: none;">
	<div class='modal-title'></div>
	<div>
		<input type='text' id='jbccontent'>
		<input type='text' id='jbcwriter'>
	</div>
	<div>
		<button type="button" id="replyModBtn"> Modify </button>
		<button type="button" id="replyDelBtn"> Delete </button>
		<button type="button" id="closeBtn"> Close </button>			
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


</body>
</html>

