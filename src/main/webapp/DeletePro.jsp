<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="JDBCConnector.jsp" %>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String sql = "select * from member where id=?";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			String passwd = rs.getString("passwd");
			if(pwd.equals(passwd)){
				sql = "delete from member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();			
				out.print("<h1>"+id+"님의 회원정보가 삭제 되었습니다.</h1>");
			}else{
				out.print("<h1>비밀번호가 잘못되어 삭제가 실패했습니다.</h1>");
			}
		}else{
			out.print("<h1>ID가 잘못되어 삭제할 수 없습니다.</h1>");
		}
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null)
				rs.close();
			
			if(pstmt != null)
				pstmt.close();
			
			if(con != null)
				con.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
%>
</body>
</html>