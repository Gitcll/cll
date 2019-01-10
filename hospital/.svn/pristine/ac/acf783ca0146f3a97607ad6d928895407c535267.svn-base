package com.chinasoft.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chinasoft.dao.impl.GuahaoDaoImpl;
import com.chinasoft.dao.impl.PatientDaoImpl;
import com.chinasoft.entity.Patient;

public class YuYueServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public YuYueServlet() {
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
		int gid=0;
		Patient p = new Patient();
		
		HttpSession session = request.getSession();
		int pid = (Integer)session.getAttribute("pid");
		System.out.println(pid);
		//增加挂号表中的挂号id
		GuahaoDaoImpl gdao = new GuahaoDaoImpl();
		PatientDaoImpl pdao = new PatientDaoImpl();
		boolean i = gdao.addGuahaoByPatient(pid);
		if(i==true){
			//取到该次增加的挂号id
			ResultSet rss = gdao.queryGidByPid(pid);
			
			try {
				if(rss.next()){
					gid= rss.getInt("g");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//将挂号id更新入对应的患者id中
			p.setPid(pid);
			p.setGuahaoId(gid);
			boolean j = pdao.updateGidByPid(p);
			if(j==true){
				out.write("恭喜您预约成功！您的预约号是："+gid);
			}else{
				out.write("预约失败请重试");
			}
		}else{
			out.write("预约失败请重试");
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
