package com.chinasoft.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chinasoft.dao.impl.PatientDaoImpl;
import com.chinasoft.entity.Patient;

public class PatientloginServlet extends HttpServlet {
     PatientDaoImpl dao = new PatientDaoImpl();
     ResultSet rs = null;
	/**
	 * Constructor of the object.
	 */
	public PatientloginServlet() {
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
		String userlogin = request.getParameter("userlogin");
		String userpwd = request.getParameter("userpwd");
		Patient patient = new Patient(userlogin,userpwd);
		Boolean flag = dao.queryByPatientNameAndPatientPwd(patient);
		int pid=0;
		String str =(String) request.getSession().getAttribute("rand");
		String yanzhengma = request.getParameter("yanzhengma");
		String str1 = str.substring(4);
		if(flag == true && str1.equals(yanzhengma))
		{
			rs = dao.queryPidByLoginName(userlogin);
			try {
				if(rs.next()){
					pid= rs.getInt("p");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			HttpSession session = request.getSession();
			session.setAttribute("pid", pid);
			
			request.getRequestDispatcher("client/reserve.jsp").forward(request, response);
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
