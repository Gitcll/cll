package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.GuahaoDaoImpl;

public class PageGuahaoServlet extends HttpServlet {
	private GuahaoDaoImpl dao=new GuahaoDaoImpl();
	int count=0;
	/**
	 * Constructor of the object.
	 */
	public PageGuahaoServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		//页面大小
		int every=3;
		String everyPage=request.getParameter("everyPage");
		if(everyPage!=null){
			every=Integer.parseInt(everyPage);
		}
		ResultSet rscount=dao.findCount();
		try {
			if(rscount.next()){
				count=rscount.getInt("co");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//页面总数
		int pageCount=count/every;
		if(count%every>0){
			pageCount+=1;
		}
		String page=request.getParameter("page");
		request.setAttribute("every", every);
		request.setAttribute("page", page);
		request.setAttribute("pageCount", pageCount);
		request.getRequestDispatcher("manager/mainGuahao.jsp").forward(request, response);
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
