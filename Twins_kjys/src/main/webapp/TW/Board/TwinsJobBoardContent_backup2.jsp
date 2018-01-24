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
  
        
<div class="row">

	<div class="col-md-12">
	
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">ADD NEW REPLY</h3>
			</div>
			<div class="box-body">
				<label for="newReplyWriter">JBCWriter</label>
					<input class="form-control" type="text" 
						placeholder="REPLIER" id="newReplyWriter"> 
				<label for="newReplyText">JBCContent</label>
					<input class="form-control" type="text" 
						placeholder="REPLY TEXT" id="newReplyText">
			</div>
			<!-- /.box-body -->
			<div class="box-footer">
				<button type="submit" class="btn btn-primary" id="replyAddBtn">
					ADD REPLY
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
					Replies List
				</span>
			</li>
		</ul>	
	</div>
	
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>	
	</div>
			
</div>

<script ="template" type="text/x-handlebars-template">
	{{#each .}}
		<li class="replyLi" data-jbcidx={{jbcidx}}>
			<i class= fa fa-comments bg-blue"></i>
			<div class="timeline-item">
				<span class="time">
					<i class="fa fa-clock-o"></i>
						{{prettifyDate jbcwritedate}}
				</span>
				<h3 class="timeline-header">
					<strong>{{jbcidx}}</strong> -{{jbcwriter}}
				</h3>
				<div class="timmeline-body">{{jbccontent}}
				</div>
				<div class="timeline-footer">
					<a class="btn btn-primary btn-xs" data-toggle="modal"
						data-target="modifyModal"> Modify
					</a>
				</div>
			</div>
		</li>
	{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});
	
	var printData = function (replyArr, target, templateObject) {
		
		var template = Handlebars.compile(templateObject.html());
		
		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);
	}
</script>

<script>

	var jbidx = 3; // ${jbv.jbidx};  // 3;
	var replyPage = 1;
	
	function getPage(pageInfo) {
		
		$.getJSON(pageInfo, function(data){
			printData(data.list, $("#repliesDiv"), $('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
		});
	}
	
	var printPaging = function(pageMaker, target){
		
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
		
		target.html(str);
	};
	
	$("#repliesDiv").on("click", function() {
		
		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + jbidx + "/1");
	});
	
	$(".pagination").on("click", "li a", function(event) {
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/" + jbidx + "/" + replyPage);
	});
	
</script>

</body>
</html>

