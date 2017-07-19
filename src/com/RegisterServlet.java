package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.Select;
import com.sun.org.glassfish.external.statistics.annotations.Reset;

import db.dbconnBook;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=gb2312");
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String passwd1 =request.getParameter("passwd1");
		String passwd2 =request.getParameter("passwd2");
		String address =request.getParameter("address");
		String postcode =request.getParameter("postcode");
		String tel =request.getParameter("tel");
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		
		try { 
		 
		 Connection conn=dbconnBook.getMySqlConnection();
		 //Connection conn=DriverManager.getConnection(url,user,password); 
		 Statement stmt=conn.createStatement(); 
		 Statement stmt1=conn.createStatement();
		 int id=0;
		 ResultSet rs2=stmt.executeQuery("select * from users where username='"+username+"'");
		 if(rs2.next()){
			 out.print("该用户已存在<a href=login.jsp>请登录</a>，或<a href=register.jsp>返回注册</a>");
		 }
		 else{			 
			 String sql = "insert into users(username,name,password,address,postcode,tel) values('" + username + "','"+ name + "','"+ passwd1 + "','" 
				 + address + "','" + postcode + "','" + tel +"')";
			 stmt.executeUpdate(sql);
			 
		     out.print("<br><h3>注册成功</h3>");
		     out.print("注册已成功，登录请<a href=login.jsp>按此</a>");
		     out.println("</center>");
				 
		 } 
	}
		 catch (SQLException e) { 
		 // TODO Auto-generated catch block  
		 e.printStackTrace(); 
		 } 
		
		
        out.println("</body>");
        out.println("</html>");
        out.flush();
        out.close();
		 
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
