package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.MedicineImpl;
import com.chinasoft.entity.Medicine;

public class AddMedicineServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddMedicineServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		int num = Integer.parseInt(request.getParameter("num"));
		String unit = request.getParameter("unit");
		String descp = request.getParameter("descp");
		double price = Double.parseDouble(request.getParameter("price"));
		Medicine m = new Medicine();
			System.out.println(new MedicineImpl().maxID()+1);
			m.setMid(new MedicineImpl().maxID()+1);
			m.setMname(name);
			m.setNum(num);
			m.setNuit(unit);
			m.setDescp(descp);
			m.setPrice(price);
			boolean b = new MedicineImpl().addMedicine(m);
			if(b == true)
			{
				out.write("新增成功！");
			}
			else
			{
				out.write("新增失败！！");
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
