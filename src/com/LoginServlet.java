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
import javax.servlet.http.HttpSession;

import db.dbconnBook;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=gb2312");
		
		String username=request.getParameter("username");
		String pswd=request.getParameter("password");
		HttpSession session = request.getSession(); 		
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		
		try { 
			Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 ResultSet rs=stmt.executeQuery("select * from users where username='" + username + "' and password='" + pswd + "'"); 
		 
		 if(rs.next()){
			 	if(username.equals("admin")){
			 		session.setAttribute("userid", rs.getInt("userid")+"");
			 		session.setAttribute("username", username);
			 		String path=request.getContextPath()+"/Admin1.jsp";
					 response.sendRedirect(path);	
			 	}
			 	else{
			 		session.setAttribute("userid", rs.getInt("userid")+"");
			 		String path=request.getContextPath()+"/list.jsp";
					 response.sendRedirect(path);	
			 	}				 
				 //out.print(session.getAttribute("userid")+"userid");
				 	  
		 }
		 else{
				 out.print("<br><h3>登录失败，请重新输入用户名和密码。</h3>");
			     out.print("<a href=login.jsp>返回</a>");
			 }
		 if(rs!=null) 
		 rs.close(); 
		 if(stmt!=null) 
		 stmt.close(); 
		 if(conn!=null) 
		 conn.close();
		 } catch (SQLException e) { 
		 // TODO Auto-generated catch block  
		 e.printStackTrace(); 
		 } 
		/*out.print("<br><h3>注册成功</h3>");
        out.print("<a href=index.jsp>进入个人中心</a>   <a href=login.jsp>返回登录</a> ");*/
        out.println("</center>");
				
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
