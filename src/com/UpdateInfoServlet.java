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
 * Servlet implementation class UpdateInfoServlet
 */
@WebServlet("/UpdateInfoServlet")
public class UpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInfoServlet() {
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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String postcode = request.getParameter("postcode");
		String tel = request.getParameter("tel");
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		
		try { 
			Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 HttpSession session = request.getSession(); 
		 String userid=(String)session.getAttribute("userid");
		 String sql = "update users set name='"+name+"', address='"+address+"', postcode='"+postcode+"',tel='"+tel+"' where userid=" + userid ;
		 stmt.executeUpdate(sql);
		 ResultSet rs=stmt.executeQuery("select * from users"); 
		 
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
		out.print("<br><h3>信息修改成功</h3>");
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
