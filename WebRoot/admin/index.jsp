 <%@page import="com.mybolg.dao.ArticleDao"%>
<%@page import="com.mybolg.bean.Article"%>
<%@page import="com.mybolg.bean.User"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>我的个人博客系统</title>
    <link rel="stylesheet" href="../css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="../css/login.css" type="text/css"></link>
    <%
    	User user=(User)session.getAttribute("user");
    	ArticleDao articleDao=new ArticleDao();
    	ArrayList<Article> articles=articleDao.getArticles();
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
		<!-- 文章列表 -->
	    <% 	if(articles.size()>0 ){
	    		for(int i=0;i<articles.size();i++){%>
	    			<div class="bbsline" id="original">
	    				标题：<%=articles.get(i).getTitle() %>
	    	 			<span class="right"><a href="/zylBlog/articleServlet?method=deleteArticle&aid=<%=articles.get(i).getAid()%>">删除</a></span><br>
	    	 			简介：<%=articles.get(i).getIntro() %><br>
	    	 			上次修改时间：<%=articles.get(i).getCreate_time() %>
	    	 			<span class="right"><a href="update.jsp?aid=<%=articles.get(i).getAid()%>">修改</a></span>
	    			</div>
	    <%}}else{%><div class="bbsline">no date</div><%} %>
    </div>
	<!-- 版权申明 -->
	<div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
