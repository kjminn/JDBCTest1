<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkDelete() {
		var checkState = confirm("정말로 삭제하시겠습니까?");	
		
		if(checkState){
			document.getElementById("frm1").submit();
		}else{
			document.getElementById("failResult").innerHTML = "삭제를 취소 했습니다."
		}
	}
</script>
</head>
<body>
	<form action="DeletePro.jsp" id="frm1">
		id: <input type="text" size="15" name="id"><br><br>
		pwd: <input type="password" size="15" name="pwd"><br><br>
		<button type="button" onclick="checkDelete()">회원정보 삭제</button>
	</form>
	<h1 id="failResult"></h1>
</body>
</html>