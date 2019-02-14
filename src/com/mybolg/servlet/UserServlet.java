package com.mybolg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybolg.bean.User;
import com.mybolg.dao.UserDao;
import com.mybolg.utils.StringUtils;

public class UserServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public UserServlet() {
		super();
	}

	/**
		 * Destruction of the servlet. <br>
		 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String method=request.getParameter("method");
		UserDao userDao=new UserDao();
		
		//用户登录
		if(method.equals("login")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			
			User user=null;
			user=userDao.userLogin(username, password);
			if(user==null){
				request.getSession().setAttribute("msg", "用户名密码不匹配！");
				response.sendRedirect("login.jsp");
			}else if(user.getType()>0){
				request.getSession().setAttribute("user",user);
				response.sendRedirect("admin/index.jsp");
			}else{
				request.getSession().setAttribute("user", user);
				response.sendRedirect("index.jsp");
			}
		//注册
		}else if(method.equals("regist")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String intro=StringUtils.change(request.getParameter("intro"));
			
			User user=new User();
			user.setEmail(email);
			user.setIntro(intro);
			user.setPassword(password);
			user.setPhone(phone);
			user.setUsername(username);
			
			userDao.userRegist(user);
			response.sendRedirect("login.jsp");
		//退出登录
		}else if(method.equals("logout")){
			request.getSession().setAttribute("user", null);
			response.sendRedirect("login.jsp");
		//更新
		}else if(method.equals("updateUser")){
			String email=request.getParameter("email");
			String phone=request.getParameter("phone");
			String intro=StringUtils.change(request.getParameter("intro"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			
			User user=new User();
			user.setEmail(email);
			user.setIntro(intro);
			user.setPhone(phone);
			user.setUid(uid);
			
			userDao.updateUser(user);
			
			request.getSession().setAttribute("user", user);
			response.sendRedirect("user.jsp");
			
		}
		
		
		out.flush();
		out.close();
	}

	/**
		 * Initialization of the servlet. <br>
		 *
		 * @throws ServletException if an error occurs
		 */
	public void init() throws ServletException {
		// Put your code here
	}

}
