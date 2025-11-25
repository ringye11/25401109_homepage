<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="dao.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");

    String uid = request.getParameter("id");
    
    UserDAO dao = new UserDAO();
    if (dao.exists(uid) == false) {
        out.print("회원 정보를 찾을 수 없습니다.");
        return;
    }
    
    if (dao.delete(uid)) {
		response.sendRedirect("end.html");
        session.removeAttribute("id");
    }
    else {
        out.print("회원 탈퇴 중 오류가 발생하었습니다.");
    }
%>