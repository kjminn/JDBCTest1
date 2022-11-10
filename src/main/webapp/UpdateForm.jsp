<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>member 테이블 수정(update)</h2>
	<form action="UpdatePro.jsp">
		아이디:<input type="text"  name="id" maxlength="10"><br><br>
		패스워드:<input type="password"  name="passwd" maxlength="10"><br><br>
		변경할 이름:<input type="text"  name="name" maxlength="10"><br><br>
		<button>입력완료</button>
	</form>
</body>
</html>