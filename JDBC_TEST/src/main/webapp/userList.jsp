<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %>
<% 
	/* Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns", "root", "1234"); */
	
	Connection  conn = ConnectionPool.get();
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT id, name FROM user");
	String str = "";
	while(rs.next()){
		str += rs.getString("id") + ", " + rs.getString("name") + "<br>";
	}
	out.print(str);
	rs.close(); stmt.close(); conn.close();
%>
