 <%@page import="com.mybolg.bean.MsgReply"%>
<%@page import="com.mybolg.dao.MsgReplyDao"%>
<%@page import="com.mybolg.bean.Message"%>
<%@page import="com.mybolg.dao.MessageDao"%>
<%@page import="com.mybolg.dao.ArticleDao"%>
<%@page import="com.mybolg.bean.Article"%>
<%@page import="com.mybolg.bean.User"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>留言回复</title>
    <link rel="stylesheet" href="../css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="../css/login.css" type="text/css"></link>
    <%
    	User user=(User)session.getAttribute("user");
    	MessageDao messageDao=new MessageDao();
    	MsgReplyDao msgReplyDao=new MsgReplyDao();
    	ArrayList<Message> messages=messageDao.getMessages();
    %>
  </head>
  
  <body>
    <div class="login_top_bg pgs">
    	<h4>您好，<%=user.getUsername() %>===
    	 	<a href="addArticle.jsp">添加文章</a>===
    	 	<a href="message.jsp">查看留言板</a>===
    	 	<a href="/zylBlog/userServlet?method=logout">退出登录</a></h4>
    </div>
    <div class="login_bg"><br>
	    <% 	if(messages.size()>0 ){
	    		for(int i=0;i<messages.size();i++){%>
	    			<div class="bbsline" id="original">
	    	 			留言内容：<%=messages.get(i).getContent() %>
	    	 			<span class="right"><%=messages.get(i).getCreate_time() %></span><br>
	    	 			<% MsgReply msgReply=msgReplyDao.getMsgReplyByMid(messages.get(i).getMid()); %>
	    	 			回复内容：<% if(msgReply==null){ %>
	    	 			<form action="/zylBlog/msgReplyServlet">
	    	 				<input name="method" value="addMsgReply" type="hidden" />
	    	 				<input name="mid" value="<%=messages.get(i).getMid() %>" type="hidden" />
	    	 				<input name="content" type="text" />
	    	 				<input value="回复" type="submit" />
	    	 			</form>
	    	 			<%}else{ %><%=msgReply.getContent() %><span class="right"><%=msgReply.getCreate_time() %></span><%} %>
	    			</div>
	    <%}}else{%><div class="bbsline">no date</div><%} %>
    </div>
	<!-- 版权申明 -->
	<div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
