<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    String uname = request.getParameter("name");
    
    UserDAO dao = new UserDAO();
    
	String message = "";
    
    if (dao.exists(uid)) {
    	message = "이미 가입한 회원입니다.";
    } 
    else if (dao.insert(uid, upass, uname)) {
        session.setAttribute("id", uid);
        response.sendRedirect("main.jsp");
        return;
    } 
    else {
    	message = "회원 가입 중 오류가 발생하였습니다.";
    }
    
    String encodedMessage = java.net.URLEncoder.encode(message, "UTF-8");
    response.sendRedirect("signup.html?error=" + encodedMessage);
    
    
%>