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
    	ArticleDao articleDao=new ArticleDao();
    	ArrayList<Article> articles=articleDao.getArticles();
    %>
  </head>
    <div class="login_top_bg pgs">
    	<h4><%if(user==null){ %>游客您好，欢迎您！如果您想留言或评论，请先<a href="login.jsp">登录</a>/<a href="regist.jsp">注册</a>哟！
    	 	<%}else{ %>您好，<%=user.getUsername() %>===<a href="index.jsp">首页</a>===
    	 	<a href="user.jsp">个人中心</a>===
    	 	<a href="/zylBlog/userServlet?method=logout">退出登录</a><%} %></h4>
    </div>
    <div class="login_bg"><br>
	    <!-- 文章列表 -->
	    <div class="bbsline">
	    	 <h2 class="pgs">文章列表</h2>
	    	 <% if(articles.size()>0 ){
	    		for(int i=0;i<articles.size();i++){%>
	    			<div id="original">
	    	 			【<%=i+1 %>】<a href="article.jsp?aid=<%=articles.get(i).getAid()%>"><%=articles.get(i).getTitle() %></a>
	    	 			<span class="right"><%=articles.get(i).getCreate_time() %></span>
	    			</div>
	   		 <%}}else{%><div class="bbsline">no date</div><%} %>
	    </div>
	    <br/>
	    <% 	if(user!=null ){%>
	    <div class="bbsline">
	    	 <form action="/zylBlog/messageServlet">
	    	 	<input type="hidden" name="method" value="addMessage">
	    	 	<input type="hidden" name="uid" value="<%=user.getUid()%>">
	            <table >
					<tr>
						<td><span class="login_txt">留言板：</span></td>
						<td><textarea rows="10" cols="60" name="content"></textarea></td>
					</tr>
	 				<tr>
	                    <td></td>
	                    <td><input type="submit" value="提交"><input type="reset" value="取 消" class="login_botton"></td>
	                </tr>
	             </table><br>
	         </form>
	    </div>
	    <%} %>
	</div>
	<!-- 版权申明 -->
	<div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
