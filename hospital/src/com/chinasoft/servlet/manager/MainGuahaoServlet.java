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

import com.chinasoft.dao.impl.GuahaoDaoImpl;
import com.chinasoft.entity.Guahao;
import com.google.gson.Gson;

public class MainGuahaoServlet extends HttpServlet {
	private GuahaoDaoImpl dao =new GuahaoDaoImpl();
	private List<Guahao> list= new ArrayList<Guahao>();
	/**
	 * Constructor of the object.
	 */
	public MainGuahaoServlet() {
		super();
	}
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		list = new ArrayList<Guahao>();
		
		//��ȡ��ǰҳ
		int page=Integer.parseInt(request.getParameter("page"));
		int every=Integer.parseInt(request.getParameter("every"));
		
		ResultSet rs=dao.find((page-1)*every, every);
		try {
			while(rs!=null&&rs.next()){
				Guahao g=new Guahao(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
				list.add(g);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		Gson gson=new Gson();
		String goal=gson.toJson(list);
		//list.clear();
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
