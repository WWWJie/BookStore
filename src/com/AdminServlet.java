package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
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
		if(userid==null){
			String path=request.getContextPath()+"/login.jsp";
			 response.sendRedirect(path);	
		}
		
		Double price=0.0;
		Double Totalprice=0.0;
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		try { 
			Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 PreparedStatement pst = null;
		 String sql1 = "update orders set status=? where orderid=?";
		 out.print(sql1);
		 pst=conn.prepareStatement(sql1);
		 ResultSet rs=stmt.executeQuery("select * from orders"); 
		 String []orderid=request.getParameterValues("orderid");
		 String orderid1=request.getParameter("orderid1");

		 //out.print("orderid:"+orderid[0]);
		 String []status = request.getParameterValues("status");
		 int i=0;		 
		 while(rs.next()){
			 
			 out.print("<br>status:"+status[i]);
			 out.print("<br>orderid:"+orderid[i]);
			 pst.setString(1, status[i]);
			 pst.setString(2, orderid[i]);
			 pst.addBatch();
			 i++;			 
			 if(i==orderid.length)  break;			 
			 
		 }
		 pst.executeBatch();
		 String path=request.getContextPath()+"/Admin1.jsp";
		 response.sendRedirect(path);
		 
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
