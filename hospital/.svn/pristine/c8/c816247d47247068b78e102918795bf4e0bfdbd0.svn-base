package com.chinasoft.upload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name="upload3",urlPatterns="/upload3")
@MultipartConfig
public class UpLoad extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpLoad() {
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
		//Servlet3.0中新引入的方法，来处理multipart/form-data类型编码的表单
		Part part = request.getPart("filename");
		//获得http头信息，headerinfor(form-data name="file" filename ="文件名")
		String headerinfor =part.getHeader("content-disposition");
		System.out.println(headerinfor);
		//从Http头信息中获取文件名 filename=(文件名)
		String filename = headerinfor.substring(headerinfor.lastIndexOf("=")+2,headerinfor.length()-1);
		System.out.println(headerinfor.length());
		System.out.println(filename);
		//获得存贮上传文件的文件夹路径
		String filesaveFolder = this.getServletContext().getRealPath("/upload");
		String filesavePath =  filesaveFolder+File.separator+filename;
		//如果上传的文件夹不存在 ，则创建文件名和原始的文件名相同
		File f = new File(filesaveFolder+ File.separator);
		 if(!f.exists())
		 {
			 f.mkdirs();
		 }
		 //将上传的文件写入服务器
		 part.write(filesavePath);
		 //输出上传成功
		 out.print("文件上传成功");
		 request.setAttribute("path", "/upload/"+filename);
		 request.getRequestDispatcher("manager/Emp_mainUpload.jsp").forward(request, response);
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
