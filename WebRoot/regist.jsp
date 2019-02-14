<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
    <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  </head>
  
  <body>
    <div class="login_top_bg"><h3>我的个人博客系统</h3></div>
    <div class="login_bg">
    	<div class="form">
    	<span class="login_txt_bt">注册博客系统</span>
    	<form action="/zylBlog/userServlet" method="post">
    		<input type="hidden" name="method" value="regist">
            <table >
				<tr>
					<td><span class="login_txt">用户名：</span></td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td><span class="login_txt">密码：</span></td>
					<td><input type="password" name="password"><img src="img/luck.gif"></td>
				</tr>
				<tr>
					<td><span class="login_txt">邮箱：</span></td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td><span class="login_txt">电话：</span></td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td><span class="login_txt">简介：</span></td>
					<td><input type="text" name="intro"></td>
				</tr>
 				<tr>
                    <td></td>
                    <td><input type="submit" value="注册"><input type="reset" value="取 消" class="login_botton"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>已账号？<a href="login.jsp">立即登录</a></td>
                </tr>
             </table><br>
         </form></div><img src="img/login-wel.gif"></img>
    </div>
    <div class="login_buttom_bg">
    	<span class="login_buttom_txt">Copyright &copy; 2009-2018 www.myblog.com</span>
    </div>
  </body>
</html>
