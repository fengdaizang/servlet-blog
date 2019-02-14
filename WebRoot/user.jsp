<%@page import="com.mybolg.dao.MsgReplyDao"%>
<%@page import="com.mybolg.bean.MsgReply"%>
<%@page import="com.mybolg.bean.Message"%>
<%@page import="com.mybolg.dao.MessageDao"%>
<%@page import="com.mybolg.dao.ArticleDao"%>
<%@page import="com.mybolg.bean.Article"%>
<%@page import="com.mybolg.bean.User"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的个人博客系统</title>
    <link rel="stylesheet" href="css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
    <%
    	User user=(User)session.getAttribute("user");
    	MessageDao messageDao=new MessageDao();
    	MsgReplyDao msgReplyDao=new MsgReplyDao();
    	ArrayList<Message> messages=messageDao.getMessagesByUid(user.getUid());
    	if(user==null){
			out.print("<script>alert('请先登录哟！');location='index.jsp'</script>");
		}
    %>
  </head>
  
  <body>
    <!-- 头部菜单 -->
     <div class="login_top_bg pgs">
    	<h4><%if(user==null){ %>游客您好，欢迎您！如果您想留言或评论，请先<a href="login.jsp">登录</a>/<a href="regist.jsp">注册</a>哟！
    	 	<%}else{ %>您好，<%=user.getUsername() %>===<a href="index.jsp">首页</a>===
    	 	<a href="user.jsp">个人中心</a>===
    	 	<a href="/zylBlog/userServlet?method=logout">退出登录</a><%} %></h4>
    </div>
    <div class="login_bg"><br>
	    <!-- 导航条 -->
	    <div class="bbsline" id="original">
	    	 <p class="pgs">修改个人信息</p>
	    	 <form method="post" style="margin-left: 30%;" action="/zylBlog/userServlet">
				<input type="hidden"  name="method" value="updateUser" />
				<input type="hidden" name="uid" value="<%=user.getUid() %>" id="uid"/>
				<table align="center">
					<tr>
						<td>邮箱:<%=user.getEmail() %></td>
						<td><input type="text" name="email" value="<%=user.getEmail() %>" /></td>
					</tr>
					<tr>
						<td>电话:<%=user.getPhone() %></td>
						<td><input type="text" name="phone"  value="<%=user.getPhone() %>"/></td>
					</tr>
					<tr>
						<td>简介:<%=user.getIntro() %></td>
						<td><input type="text" name="intro"  value="<%=user.getIntro() %>"/></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="submit" name="submit" value="提交"/>
							<input type="button" name="close" value="取消"/>
						</td>
					</tr>
				</table>
			</form>
	    </div>
		<!-- 留言列表 -->
	    <% 	if(messages.size()>0 ){
	    		for(int i=0;i<messages.size();i++){%>
	    			<div class="bbsline" id="original">
	    	 			留言内容：<%=messages.get(i).getContent() %>
	    	 			<span class="right"><%=messages.get(i).getCreate_time() %></span><br>
	    	 			<% MsgReply msgReply=msgReplyDao.getMsgReplyByMid(messages.get(i).getMid()); %>
	    	 			回复内容：<% if(msgReply==null){ %>还没有回复哟
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
