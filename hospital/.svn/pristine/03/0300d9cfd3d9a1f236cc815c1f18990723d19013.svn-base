package com.chinasoft.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.entity.Emp;
import com.chinasoft.entity.EmpAndKeshi;
import com.chinasoft.service.impl.EmpSericeImpl;

public class CheckDoctorByKeshi extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckDoctorByKeshi() {
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
		String keshi = request.getParameter("keshi");
		System.out.println(keshi);
		EmpSericeImpl dao = new EmpSericeImpl();
		List<EmpAndKeshi> list = new ArrayList<EmpAndKeshi>();
		list = dao.queryDoctorByKeshi(Integer.parseInt(keshi));	
		request.setAttribute("doctorlist", list);
		EmpAndKeshi emp = dao.queryPosByKeshi(Integer.parseInt(keshi));
		String name = emp.getUsername();
		String sex = emp.getSex();
		int age = emp.getAge();
		String zhiwei = emp.getPos();
		String keshiname = emp.getK_name();
		String dept = emp.getD_name();
		request.setAttribute("doctorname", name);
		request.setAttribute("doctorsex", sex);
		request.setAttribute("doctorage", age);
		request.setAttribute("doctorzhiwei", zhiwei);
		request.setAttribute("keshiname", keshiname);
		request.setAttribute("dept", dept);
		request.getRequestDispatcher("client/Emp_YuYue.jsp").forward(request, response);
		
		
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
