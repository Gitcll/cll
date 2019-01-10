package com.chinasoft.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.PatientDaoImpl;
import com.chinasoft.entity.Patient;

public class PatientRegisterServlet extends HttpServlet {
    PatientDaoImpl dao = new PatientDaoImpl();
	/**
	 * Constructor of the object.
	 */
	public PatientRegisterServlet() {
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
		PrintWriter out = response.getWriter();
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
		String username = request.getParameter("username");
		System.out.println(username);
		String userlogin = request.getParameter("userlogin");
		
		String str =(String) request.getSession().getAttribute("rand");
		String str1 = str.substring(4);
		String yanzhengma = request.getParameter("yanzhengma");
		String userpwd = request.getParameter("pwd");
		String sex = request.getParameter("sex");
		
		
		Patient patient = new Patient(username,userlogin,userpwd,sex);
		
		
		boolean i = dao.registerUser(patient);
		System.out.println(yanzhengma);
		if( i == true && str1.equals(yanzhengma))
		{
			out.write("ע��ɹ�");
			request.getRequestDispatcher("client/rePatientlogin.jsp").forward(request, response);
		}else
		{
			request.getRequestDispatcher("client/Error.jsp").forward(request, response);
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
