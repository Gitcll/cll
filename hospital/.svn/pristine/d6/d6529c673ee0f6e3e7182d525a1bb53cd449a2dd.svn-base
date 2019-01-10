package com.chinasoft.servlet.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.chinasoft.util.DBUtil;

public class SearchDoctorServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchDoctorServlet() {
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

		//先获得表单提交的关键字
		String str = request.getParameter("search");
		
		ArrayList<String> list = new ArrayList<String>();
		try
		{
	       //获得连接对象
		   Connection conn = DBUtil.getConnection();
		   
		   String sql = "select distinct (username) from patient where username like '"+str+"%'";
           Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery(sql);
           while(rs.next())
           {
        	   list.add(rs.getString("username"));
           }
           //打得到的结果用字符串封装，每个关键字中间使用-分隔
           StringBuffer sb = new StringBuffer();
           for(int i=0;i<list.size();i++)
           {
        	   sb.append(list.get(i)+"-");
           }
           System.out.println(sb.toString());
           out.println(sb.toString());
		   out.flush();
		   out.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
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
