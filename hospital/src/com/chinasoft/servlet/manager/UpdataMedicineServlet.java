package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.MedicineImpl;
import com.chinasoft.entity.Medicine;

public class UpdataMedicineServlet extends HttpServlet {
	MedicineImpl dao = new MedicineImpl();
	/**
	 * Constructor of the object.
	 */
	public UpdataMedicineServlet() {
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
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("mid"));
		String name = request.getParameter("mname");
		int mnum = Integer.parseInt(request.getParameter("mnum"));
		String munit = request.getParameter("munit");
		String mdescp = request.getParameter("mdescp");
		double mprice = Double.parseDouble(request.getParameter("mprice"));
		
		System.out.println(id);
		
		Medicine m = new Medicine();
		m.setMid(id);
		m.setMname(name);
		m.setNum(mnum);
		m.setNuit(munit);
		m.setDescp(mdescp);
		m.setPrice(mprice);
		boolean b = new MedicineImpl().updateMedicineByid(m);
		if(b == true)
		{
			out.write("更新成功！");
		}
		else
		{
			out.write("更新失败！！");
		}
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

		this.doPost(request, response);
		
		
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
