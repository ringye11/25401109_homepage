<%@ page contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.net.URLEncoder" %>
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
    <title>Main</title>
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
             <div class="feed_user" onclick="location.href='feedModify.jsp?no=<%= feed.getNo() %>'">
			      <%= feed.getId() %>
			 </div>
             <div class="feed_time"><%= feed.getTs() %></div>
             <div class="feed_close"><button class="btn_close" onclick="location.href='feedDelete.jsp?ts=<%= feed.getTs() %>'">X</button></div>
         </div>

         <div class="feed_body">
             <div class="feed_row">
                 <% if (feed.getImages() != null && !feed.getImages().equals("")) { %>
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
