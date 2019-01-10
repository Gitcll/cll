package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.chinasoft.dao.impl.ChuFangDaoImpl;

public class PageChuFangServlet extends HttpServlet {

	private ChuFangDaoImpl dao = new ChuFangDaoImpl();
	int count = 0;
	
	/**
	 * Constructor of the object.
	 */
	public PageChuFangServlet() {
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
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		
		//设置页面大小
				int every = 4;
				
				String everyPage = request.getParameter("everyPage");
				if(everyPage != null)
				{
					every = Integer.parseInt(everyPage);
					System.out.println(every);
				}
				ResultSet rscount = dao.findCount();

				try {
					if(rscount.next())
					{
						count = rscount.getInt("co");
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					//求页面总数
				int pageCount = count/every;
				if(count % every >0)
				{
					pageCount += 1;
				}
				//获取当前行页
				String page = request.getParameter("page");
				request.setAttribute("every", every);
				//将当前页保存在请求中
				request.setAttribute("page", page);
				//将总页数保存在请求中
				request.setAttribute("pageCount", pageCount);
				request.getRequestDispatcher("manager/addChuFang.jsp").forward(request, response);
				
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

		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		this.doGet(request, response);
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
