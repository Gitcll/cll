package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.PatientDaoImpl;
import com.chinasoft.entity.Patient;
import com.google.gson.Gson;


public class PatientFindAllServlet extends HttpServlet {

	PatientDaoImpl dao = new PatientDaoImpl();
	List<Patient> list = null;
	/**
	 * Constructor of the object.
	 */
	public PatientFindAllServlet() {
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
		list = new ArrayList<Patient>();
				//获取当行页
				String ppage = request.getParameter("page");
						//==""?"1":request.getParameter("page");
				System.out.println("queding:"+ppage);
				String every = request.getParameter("pevery");
						//==""?"5":request.getParameter("every");

				System.out.println("every:"+every);
				ResultSet rs = dao.find((Integer.parseInt(ppage)-1)*Integer.parseInt(every),Integer.parseInt(every));
				//(Integer.parseInt(ppage)-1)*every
				list = new ArrayList<Patient>();
				try {
					while(rs != null && rs.next())
					{
						Patient p = new Patient(rs.getInt(1), rs.getString(2), rs.getString(3), 
								rs.getInt(4),rs.getString(5), rs.getString(6), rs.getString(7),rs.getInt(8),rs.getInt(9));
					  list.add(p);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Gson gson = new Gson();
				String goal = gson.toJson(list);
				out.write(goal);
		
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
