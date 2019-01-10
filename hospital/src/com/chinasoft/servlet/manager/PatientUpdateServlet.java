package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.PatientDaoImpl;
import com.chinasoft.entity.Patient;

public class PatientUpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PatientUpdateServlet() {
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
		String name = request.getParameter("fname");
		String sex = request.getParameter("fsex");
		int age = Integer.parseInt(request.getParameter("fage"));
		String addr = request.getParameter("faddr");
		String phonenum = request.getParameter("fphonenum");
		String zhuyuan = request.getParameter("fzhuyuan");
		int nid = Integer.parseInt(request.getParameter("nid"));
		Patient p = new Patient();
		
		if(name ==""){
			out.write("患者姓名不能为空");
		}else{
			p.setPatientName(name);
			p.setPatientSex(sex);
			p.setPatientAge(age);
			p.setPatientAdd(addr);
			p.setPatientPhoneNum(phonenum);
			p.setZhuyuan(zhuyuan);
			p.setPid(nid);
			boolean i = new PatientDaoImpl().updatePatientByPid(p);
			if(i == true){
				out.write("更新成功");
			}else{
				out.write("更新失败");
			}
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
