package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.dao.impl.GuahaoDaoImpl;
import com.chinasoft.entity.Guahao;
import com.chinasoft.service.impl.GuahaoServiceImpl;

public class AddGuahaoServlet extends HttpServlet {
	private GuahaoServiceImpl gh=new GuahaoServiceImpl();
	private GuahaoDaoImpl dao=new GuahaoDaoImpl();
	private Guahao g=null;
	/**
	 * Constructor of the object.
	 */
	public AddGuahaoServlet() {
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
		doPost(request,response);		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//int g_id=Integer.parseInt(request.getParameter("g_id"));
		int g_id=dao.maxGuahaoId()+1;
		String gh_date=request.getParameter("date");
		String status=request.getParameter("status");
		String grade=request.getParameter("grade");
		int visit=Integer.parseInt(request.getParameter("visit"));
		g=new Guahao(g_id,gh_date,status,grade,visit);
		boolean b=gh.addGuahao(g);
		if(b==true){
			out.write("新增成功");
		}else{
			out.write("新增失败");
		}
	}	
	public void init() throws ServletException {
		// Put your code here
	}

}
