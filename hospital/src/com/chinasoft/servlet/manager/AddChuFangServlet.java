package com.chinasoft.servlet.manager;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.chinasoft.dao.impl.ChuFangDaoImpl;
import com.chinasoft.entity.ChuFang;


public class AddChuFangServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public AddChuFangServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		this.doPost(request, response);
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
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			String chu_date = request.getParameter("chu_date");
			String diagnosis = request.getParameter("diagnosis");
			String content = request.getParameter("content");
			ChuFang cf = new ChuFang();
			System.out.println(new ChuFangDaoImpl().maxID()+1);
			cf.setC_id(new ChuFangDaoImpl().maxID()+1);
				cf.setChu_date(chu_date);
				cf.setDiagnosis(diagnosis);
				cf.setContent(content);
				boolean b = new ChuFangDaoImpl().addChuFang(cf);
				if(b == true)
				{
					out.write("上次新增成功！");
				}
				else
				{
					out.write("上次新增失败！！");
				}
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


