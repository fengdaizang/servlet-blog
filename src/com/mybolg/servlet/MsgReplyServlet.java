package com.mybolg.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mybolg.bean.MsgReply;
import com.mybolg.dao.MsgReplyDao;
import com.mybolg.utils.StringUtils;
import com.mybolg.utils.TimeUtils;

public class MsgReplyServlet extends HttpServlet {

	/**
		 * Constructor of the object.
		 */
	public MsgReplyServlet() {
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
		MsgReplyDao msgReplyDao=new MsgReplyDao();
		
		if(method.equals("addMsgReply")){
			String content=StringUtils.change(request.getParameter("content"));
			int mid=Integer.parseInt(request.getParameter("mid"));
			
			MsgReply msgReply=new MsgReply();
			msgReply.setMid(mid);
			msgReply.setContent(content);
			msgReply.setCreate_time(TimeUtils.getCurrentTime());
			
			msgReplyDao.addMsgReply(msgReply);
			
			response.sendRedirect("admin/message.jsp");
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
