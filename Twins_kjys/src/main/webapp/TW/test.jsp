<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Ajax Test Page</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<style>

	#modDiv {
		width : 300px;
		height : 100px;
		background-color : gray;
		position : absolute;
		top : 50%;
		left : 50%;
		margin-top : -50px;
		margin-left : -150px;
		padding : 10px;
		z-index : 1000;
	}

</style>

<body>
<h2>
	Ajax Test Page
</h2>

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
		JBCWriter <input type='text' name='jbcwriter' id='newReplyWriter'>
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
