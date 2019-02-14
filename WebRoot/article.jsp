<%@page import="com.mybolg.dao.UserDao"%>
<%@page import="com.mybolg.dao.ReplyDao"%>
<%@page import="com.mybolg.bean.Reply"%>
<%@page import="com.mybolg.dao.ArticleDao"%>
<%@page import="com.mybolg.bean.Article"%>
<%@page import="com.mybolg.bean.User"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>查看文章详细信息</title>
    <link rel="stylesheet" href="css/index.css" type="text/css"></link>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
    
    <%
    	User user=(User)session.getAttribute("user");
    	UserDao userDao=new UserDao();
    	String aid=request.getParameter("aid");
    	ArticleDao articleDao=new ArticleDao();
    	ReplyDao replyDao=new ReplyDao();
    	ArrayList<Article> articles=articleDao.getArticles();
    	
    	Article article=articleDao.getArticleByAid(aid);
    	ArrayList<Reply> replies=replyDao.getReplysByAid(aid);
    	if(user==null){
			out.print("<script>alert('请先登录哟！');location='index.jsp'</script>");
		}
    %>
  </head>
  
  <body>
    <div class="login_top_bg pgs">
    	<h4><%if(user==null){ %>游客您好，欢迎您！如果您想留言或评论，请先<a href="login.jsp">登录</a>/<a href="regist.jsp">注册</a>哟！
    	 	<%}else{ %>您好，<%=user.getUsername() %>===<a href="index.jsp">首页</a>===
    	 	<a href="user.jsp">个人中心</a>===
    	 	<a href="/zylBlog/userServlet?method=logout">退出登录</a><%} %></h4>
    </div>
    <div class="login_bg"><br>
	    <div class="bbsline">
	    	 <h2 class="pgs"><%=article.getTitle() %></h2>
	    	 <h3 class="pgs"><%=article.getIntro() %></h3>
	    	 <p class="pgs"><%=article.getContent() %></p>
	    </div>
	    <div class="bbsline">
	    	 <form action="/zylBlog/replyServlet">
	    	 	<input type="hidden" name="method" value="addReply">
	    	 	<input type="hidden" name="aid" value="<%=article.getAid()%>">
	    	 	<input type="hidden" name="uid" value="<%=user.getUid()%>">
	    	 	<input type="text" name="content">
	    	 	<input type="submit" value="提交评论">
	    	 </form>
	    </div>
		<!-- 评论列表 -->
	    <% 	if(replies.size()>0 ){
	    		for(int i=0;i<replies.size();i++){%>
	    			<div class="bbsline" id="original">
	    				<h3><%=replies.get(i).getContent() %></h3>
	    	 			用户：<%=userDao.getUserByUid(replies.get(i).getUid()+"").getUsername() %>
	    	 			<span class="right">发表时间：<%=replies.get(i).getCreate_time() %></span>
	    			</div>
	    <%}}else{%><div class="bbsline">暂时还没有评论哟！</div><%} %>
    </div>
	<!-- 版权申明 -->
	<div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
