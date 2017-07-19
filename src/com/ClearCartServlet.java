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
 * Servlet implementation class ClearCartServlet
 */
@WebServlet("/ClearCartServlet")
public class ClearCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClearCartServlet() {
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
		HttpSession session = request.getSession(); 
		String userid=(String)session.getAttribute("userid");
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		try { 
			Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 ResultSet rs=stmt.executeQuery("select * from cart where userid='"+userid+"'"); 
		 
		 if(rs.next()){			 
			 String sql="delete from cart where userid='"+userid+"'";
			 stmt.execute(sql);
			 String path=request.getContextPath()+"/cart.jsp";
			 response.sendRedirect(path);
			 
		 }
		 else{
				 out.print("<br><h3>购物车为空</h3>");
		 }
		 ResultSet rs1 = stmt.executeQuery("select * from cart"); 
		 if(rs1!=null) 
		 rs1.close(); 
		 if(stmt!=null) 
		 stmt.close(); 
		 if(conn!=null) 
		 conn.close();
		 } catch (SQLException e) { 
		 // TODO Auto-generated catch block  
		 e.printStackTrace(); 
		 } 
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
