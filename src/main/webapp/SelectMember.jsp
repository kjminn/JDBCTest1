<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td width="100">아이디</td>
			<td width="100">패스워드</td>
			<td width="100">이름</td>
			<td width="250">가입일자</td>
		</tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String DRIVER_PATH="oracle.jdbc.driver.OracleDriver";
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String ID = "c##minn";
		String PWD = "1234";
		
		Class.forName(DRIVER_PATH);
		System.out.println("Driver를 정상적으로 로드하였습니다.");
		con = DriverManager.getConnection(URL, ID, PWD);	
		System.out.println("연결되었습니다.");
		String sql = "select * from member";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString("id");
			String passwd = rs.getString("passwd");
			String name = rs.getString("name");
			Timestamp reg_date = rs.getTimestamp("reg_date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			String date = sdf.format(reg_date);
%>
			<tr>
				<td><%=id %></td>
				<td><%=passwd %></td>
				<td><%=name %></td>
				<td><%=date %></td>
			</tr>
<%
		}
	}catch(Exception e){
		
	}finally{
		if(rs != null)
			try{
				rs.close();
			}catch(SQLException e){
			}
		
		if(pstmt != null)
			try{
				rs.close();
			}catch(SQLException e){
			}
		
		if(con != null)
			try{
				rs.close();
			}catch(SQLException e){
			}
	}


%>		
	</table>
</body>
</html>