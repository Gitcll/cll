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

import com.chinasoft.dao.impl.ChuFangDaoImpl;
import com.chinasoft.entity.ChuFang;

import com.google.gson.Gson;

public class UpdateChuFangServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	ChuFangDaoImpl dao = new ChuFangDaoImpl();
	List<ChuFang> list = new ArrayList<ChuFang>();
	/**
	 * Constructor of the object.
	 */
	public UpdateChuFangServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//��ȡ��ǰҳ
				int page = Integer.parseInt(request.getParameter("page"));
				int every = Integer.parseInt(request.getParameter("every"));
				ResultSet rs = dao.find((page-1)*every, every);
				try {
					while(rs != null && rs.next())
					{
						ChuFang cf  = new ChuFang(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4));
						list.add(cf);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Gson gson = new Gson();
				String goal = gson.toJson(list);
				list.clear();
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


