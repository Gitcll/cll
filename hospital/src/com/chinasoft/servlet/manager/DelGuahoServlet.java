package com.chinasoft.servlet.manager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chinasoft.service.impl.GuahaoServiceImpl;

public class DelGuahoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelGuahoServlet() {
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
		String gid=request.getParameter("gid");
		int g_id=Integer.parseInt(gid.substring(13));
		System.out.println(g_id);
		GuahaoServiceImpl gh=new GuahaoServiceImpl();
		boolean b=gh.delGuahaoByGuahaoId(g_id);
		System.out.println(b);
		if(b==true){
			out.write("É¾³ý³É¹¦");
		}else{
			out.write("É¾³ýÊ§°Ü");
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
