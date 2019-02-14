package com.mybolg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybolg.bean.Article;
import com.mybolg.dao.ArticleDao;
import com.mybolg.utils.StringUtils;
import com.mybolg.utils.TimeUtils;

public class ArticleServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public ArticleServlet() {
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
		ArticleDao articleDao=new ArticleDao();
		
		if(method.equals("addArticle")){
			String title=StringUtils.change(request.getParameter("title"));
			String content=StringUtils.change(request.getParameter("content"));
			String intro=StringUtils.change(request.getParameter("intro"));
			
			Article article=new Article();
			article.setContent(content);
			article.setCreate_time(TimeUtils.getCurrentTime());
			article.setIntro(intro);
			article.setTitle(title);
			
			articleDao.addArticle(article);
			
			response.sendRedirect("admin/index.jsp");
		}else if(method.equals("updateArticle")){
			String title=StringUtils.change(request.getParameter("title"));
			String content=StringUtils.change(request.getParameter("content"));
			String intro=StringUtils.change(request.getParameter("intro"));
			int aid=Integer.parseInt(request.getParameter("aid"));
				
			Article article=new Article();
			article.setContent(content);
			article.setCreate_time(TimeUtils.getCurrentTime());
			article.setIntro(intro);
			article.setTitle(title);
			article.setAid(aid);
			
			articleDao.updateArticle(article);
				
			response.sendRedirect("admin/index.jsp");
		}else if(method.equals("deleteArticle")){
			int aid=Integer.parseInt(request.getParameter("aid"));
			articleDao.deleteArticle(aid);
			
			response.sendRedirect("admin/index.jsp");
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
