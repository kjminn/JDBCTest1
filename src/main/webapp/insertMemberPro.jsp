<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	
	String DRIVER_PATH="oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String ID = "c##minn";
	String PWD = "1234";
	
	String str = "";
	Connection con = null;
	PreparedStatement pstmt = null;
	try{
		Class.forName(DRIVER_PATH);
		System.out.println("Driver를 정상적으로 로드하였습니다.");
		con = DriverManager.getConnection(URL, ID, PWD);	
		System.out.println("연결되었습니다.");
		
		String sql = "insert into member values(?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		pstmt.setTimestamp(4, reg_date);
		
		pstmt.executeUpdate();
		
		str = "member 테이블에 새로운 레코드가 추가되었습니다.";
	}catch(Exception e){
		str = "member 테이블에 새로운 레코드 추가를 실패했습니다.";
	}finally{
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				
			}	
		}
		
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				
			}	
		}
	}
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=str %></h2>
</body>
</html>