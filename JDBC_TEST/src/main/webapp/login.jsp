<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    String upass = request.getParameter("ps");
    
    UserDAO dao = new UserDAO();
    

	String name = dao.loginAndGetName(uid, upass);
    if (name == null) {
    	out.print("아이디가 존재하지 않습니다.");
    }
    else if (name.equals("")) {
    	out.print("패스워드가 일치하지 않습니다.");
    }
    else {
	    session.setAttribute("id", uid);
	    session.setAttribute("name", name);
		response.sendRedirect("main.jsp");
    }
%>
