<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String DRIVER_PATH = "oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	String ID = "c##minn";
	String PWD = "1234";
	
	try{
		Class.forName(DRIVER_PATH);
		con = DriverManager.getConnection(URL, ID, PWD);
		
		String sql = "select id, passwd from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String sId = rs.getString("id");
			String sPasswd = rs.getString("passwd");
			if(passwd.equals(sPasswd)){
				sql = "update member set name=? where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
%>
<body>
		<h1><%=id+"님의 성명이 변경되었습니다." %></h1>
</body>
<%
			}else{
				out.print("<h2>패스워드가 틀렸습니다.</h2>");
			}
		}else{
			out.print("<h2>아이디가 틀렸습니다.</h2>");
		}
		
	}catch(ClassNotFoundException e){
		System.out.print("드라이버 클래스를 찾지 못했습니다.");
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		if(con != null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
			
	}
%>
</html>