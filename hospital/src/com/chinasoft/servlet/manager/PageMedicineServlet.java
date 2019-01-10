package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.MedicineImpl;
import com.chinasoft.entity.Medicine;

public class PageMedicineServlet extends HttpServlet {
	
	private MedicineImpl dao = new MedicineImpl();
	//数据总行数
	int count = 0;

	/**
	 * Constructor of the object.
	 */
	public PageMedicineServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//设置页面大小
		int every = 6;
		
		String everyPage = request.getParameter("everyPage");
		if(everyPage != null)
		{
			every = Integer.parseInt(everyPage);
			
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
		request.getRequestDispatcher("manager/Medicine.jsp").forward(request, response);
		
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
