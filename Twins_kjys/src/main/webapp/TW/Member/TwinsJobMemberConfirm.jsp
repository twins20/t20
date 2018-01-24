<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var result = ${rd};

parent.message(result);

//		else if((id< "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){
//			alert("한글 및 특수문자는 아이디로 사용할 수 없습니다.");
//			return false;
//		}

//                var param="jmid="+jmid
//                httpRequest = getXMLHttpRequest();
//                httpRequest.onreadystatechange = callback();
//               httpRequest.open("POST", "/twins/jmConfirmIDController", true);    
//                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
//                httpRequest.send(param);
//		}

//	function callback(){
//		if(httpRequest.readyState == 4){
			
//			var resultText = httpRequest.responseText;
//			if(resultText == 0){
//				alert("사용할수 없는 아이디입니다.")
//				document.checkForm.getElementById("cancelBtn").style.visibility = 'visible';
//				document.checkForm.getElementById("useBtn").style.visibility='hidden';
//				document.checkForm.getElementById("msg").innerHTML = "";
//			}
//			else if(resultText == 1){
//				document.checkForm.getElementById("cancelBtn").style.visibility = 'visible';
//				document.checkForm.getElementById("useBtn").style.visibility='hidden';
//				document.checkForm.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
//			}
//		}
//	}
//	function sendCheckValue(){
//		opener.document.userInfo.idDuplication.value = "idCheck";
		
//		opener.document.userInfo.id.value = document.getElementById("userId").value;
		
//		if (opener != null) {
//			opener.chkForm = null;
//			self.close();
//		}
//	}
</script>
</head>
<body>
</body>
</html>