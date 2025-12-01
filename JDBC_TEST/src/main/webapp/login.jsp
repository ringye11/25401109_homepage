<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    
    UserDAO dao = new UserDAO();

	String message = "";

	String name = dao.loginAndGetName(uid, upass);
    if (name == null) {
    	message = ("아이디가 존재하지 않습니다.");
    }
    else if (name.equals("")) {
    	message = ("패스워드가 일치하지 않습니다.");
    }
    else {
	    session.setAttribute("id", uid);
	    session.setAttribute("name", name);
		response.sendRedirect("main.jsp");
		return;
    }
    
    String encodedMessage = java.net.URLEncoder.encode(message, "UTF-8");
    response.sendRedirect("login.html?error=" + encodedMessage);
%>
