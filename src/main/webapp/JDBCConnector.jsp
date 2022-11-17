<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
	<%
		String DRIVER_PATH="oracle.jdbc.driver.OracleDriver";
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String ID = "c##minn";
		String PWD = "1234";
		
		Class.forName(DRIVER_PATH);
		System.out.println("Driver를 정상적으로 로드하였습니다.");
		Connection con = DriverManager.getConnection(URL, ID, PWD);	
		System.out.println("연결되었습니다.");
	%>