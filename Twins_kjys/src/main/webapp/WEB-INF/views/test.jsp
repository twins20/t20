<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Ajax Test Page</title>
</head>
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
	<ul id="replies">
	</ul>
</div>
		
<script>		
	var bno = 1;
	
	$.getJSON("/replies/all/" + bno, function(data){
		
		console.log(data.length);
		
	});
</script>	

<!-- 
<script>
	
	var bno = 1;

	$.getJSON("/replies/all/" + bno, function(data){
		
		var str="";
		console.log(data.length);
		
		$(data).each(
				function() {
					str += "<li data-rno='"+this.rno+"' class=replyLi'>"
						+ this.rno + ":" + this.replytest
						+ "</li>";
				});
		$("#replies").html(str);
	});
	
</script>	
 -->

<script>

	function getAllList() {
		
		var bno = 1;
	
		$.getJSON("/replies/all/" + bno, function(data){
			
			var str="";
			console.log(data.length);
			
			$(data).each(
					function() {
						str += "<li data-rno='"+this.rno+"' class=replyLi'>"
							+ this.rno + ":" + this.replytest
							+ "</li>";
					});
			$("#replies").html(str);
		});
	}
	
</script>	


<input type="button" value="삭제" onclick="DeleteYN();"/>
<input type="button" value="getAllList" onclick="getAllList();"/>

</body>
</html>
