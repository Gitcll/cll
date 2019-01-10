package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.EmpDaoImpl;
import com.chinasoft.entity.Emp;

public class Emp_UpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Emp_UpdateServlet() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
			String e_id1 = request.getParameter("e_id");
			int e_id =Integer.parseInt(e_id1.trim());
			
			
			String username = request.getParameter("username");
			String userlogin = request.getParameter("userlogin");
			String userpwd = request.getParameter("userpwd");
			String hiredate = request.getParameter("hiredate");
			String sex = request.getParameter("sex");
			
			String age1 = request.getParameter("age");
			int age =Integer.parseInt(age1);
			
			String education = request.getParameter("education");
			String addr = request.getParameter("addr");
			String iphone = request.getParameter("iphone");
			
			String d_id1 = request.getParameter("d_id");
			int d_id =Integer.parseInt(d_id1.trim());
			
			String q_id1 = request.getParameter("q_id");
			int q_id =Integer.parseInt(q_id1.trim());
			String usertype = request.getParameter("usertype");
			String pos = request.getParameter("pos");
			
		
			
			
			Emp emp = new Emp();
			emp.setE_id(e_id);
			emp.setUsername(username);
			emp.setUserlogin(userlogin);
			emp.setUserpwd(userpwd);
			emp.setHiredate(hiredate);
			emp.setSex(sex);
			emp.setAge(age);
			emp.setEducation(education);
			emp.setAddr(addr);
			emp.setIphone(iphone);
			emp.setD_id(d_id);
			emp.setQ_id(q_id);
			emp.setUsertype(usertype);
			emp.setPos(pos);
			
			EmpDaoImpl dao = new EmpDaoImpl();
			boolean i = dao.updateUserByUserId(emp);
			if(i == true)
			{
				out.write("修改成功");
			}else
			{
				out.write("修改失败");
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
