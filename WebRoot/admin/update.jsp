<%@page import="com.mybolg.bean.User"%>
<%@page import="com.mybolg.bean.Article"%>
<%@page import="com.mybolg.dao.ArticleDao"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<title>更新文章数据</title>
  	<link rel="stylesheet" href="../css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="../css/login.css" type="text/css"></link>
    <%
    	User user=(User)session.getAttribute("user");
  		String aid=request.getParameter("aid");
  		ArticleDao articleDao=new ArticleDao();
  		Article article=articleDao.getArticleByAid(aid);
  	 %>
  </head>
  
  <body>
    <!-- 更新文章 -->
    <div class="login_top_bg pgs">
    	<h4>您好，<%=user.getUsername() %>===
    	 	<a href="addArticle.jsp">添加文章</a>===
    	 	<a href="message.jsp">查看留言板</a>===
    	 	<a href="/zylBlog/userServlet?method=logout">退出登录</a></h4>
    </div>
    <div class="login_bg">
    	<div class="form">
    	<span class="login_txt_bt">修改文章内容</span>
			<form method="post" action="/zylBlog/articleServlet">
				<input type="hidden" name="method" value="updateArticle" />
				<input type="hidden" name="aid" value="<%=aid %>" />
				<table>
					<tr>
						<td>标题:</td>
						<td><input type="text" name="title" value="<%=article.getTitle() %>"/></td>
					</tr>
					<tr>
						<td>简介:</td>
						<td><input type="text" name="intro" value="<%=article.getIntro() %>"/></td>
					</tr>
					<tr>
						<td>内容:</td>
						<td><input type="text" name="content"  value="<%=article.getContent() %>"/></td>
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
	</div>
	<!-- 版权申明 -->
	<div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
