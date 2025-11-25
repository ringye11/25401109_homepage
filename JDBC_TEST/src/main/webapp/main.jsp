<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>

<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("login.html");
        return;
    }

    ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>작성글 리스트</title>
	<link rel="stylesheet" href="css/main.css" />
</head>
<body>
	<button class="mypage" type="button" onclick="location.href='mypage.jsp'">
            MYPAGE
    </button>
     <button
         class="write" type="button" onclick="location.href='feedAdd.html'">
         WRITE
     </button>
     <div class="feed_list">
         <% for (FeedObj feed : feeds) { String img = feed.getImages(); %>
         <div class="feed_header">
             <div class="feed_user"><%= feed.getId() %></div>
             <div class="feed_time"><%= feed.getTs() %></div>
             <div class="feed_close"><button class="btn_close" onclick="location.href='feedDelete.jsp?ts=<%= feed.getTs() %>'">X</button></div>
         </div>

         <div class="feed_body">
             <div class="feed_row">
                 <% if (img != null) { %>
                 <img class="feed_img" src="images/<%= img %>" />
                 <% } %>
                 <div class="feed_content"><%= feed.getContent() %></div>
             </div>
         </div>
         <hr />

         <% } %>
     </div>
</body>
</html>



<%-- <%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dao.*" %>
<%
    String uid = (String) session.getAttribute("id");
    if (uid == null) {
        response.sendRedirect("login.html");
        return;
    }
    session.setAttribute("id", uid);
    
	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();
    
    String str = "<table align=center>";
    str += "<tr height=40><td><b>작성글 리스트</b></td>";
    str += "<td align=right>";
    str += "<a href='feedAdd.html'><button>글쓰기</button></a>"; 
    str += "</td></tr>";
    
    for (FeedObj feed : feeds) {
        String img = feed.getImages(), imgstr = "";
        if (img != null) {
            imgstr = "<img src='images/" + img + "' width=240>";
        }    	
        str += "<tr><td colspan=2><hr></td></tr>";
        str += "<tr>";
    	str += "<td><small>" + feed.getId() + "</small></td>";
    	str += "<td><small>&nbsp;(" + feed.getTs() + ")</small></td>";
        str += "</tr>";
    	str += "<tr><td colspan=2>" + imgstr + "</td></tr>";
    	str += "<tr><td colspan=2>" + feed.getContent() + "</td></tr>";
    }
    str += "</table>";
    out.print(str);
%> --%>