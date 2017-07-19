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

import db.dbconnBook;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookServlet() {
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
		String isbn = request.getParameter("ISBN");
		String bookname = request.getParameter("bookname");
		String author =request.getParameter("author");
		String publisher =request.getParameter("publisher");
		String year =request.getParameter("year");
		String price =request.getParameter("price");
		String abstracts =request.getParameter("abstracts");
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		
		try { 
		 
		 Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		
		  
		 String sql = "insert into book(isbn,bname,author,publisher,year,price,abstracts) values('" + isbn + "','"+ bookname + "','"+ author + "','" 
				 + publisher + "','" + year + "','" + price + "','" +abstracts+"')";
			 stmt.executeUpdate(sql);
			 
		     out.print("<br><h3>添加图书成功</h3>");
		     out.print("<a href=list.jsp>查看图书信息</a>     <a href=AddBook.jsp>继续添加图书</a>");
		     out.println("</center>");
				 
		 
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
