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
import javax.sound.midi.Patch;

import db.dbconnBook;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
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
		 PreparedStatement pst2 = null;
		 String sql1 = "update cart set amount=? ,TotalPrice=? where bookid=? and userid=?";
		 pst=conn.prepareStatement(sql1);
		 String sql2="delete from cart where userid=? and bookid=?";
		 pst2=conn.prepareStatement(sql2);
		 ResultSet rs=stmt.executeQuery("select * from cart where userid=" + userid ); 
		 		 
		 String []amount=request.getParameterValues("amount");
		 String []bookid=request.getParameterValues("bookid");
		 int i=0;
		 int num=0;
		 while(rs.next()){			 
			 price=rs.getDouble("price");
			 if(amount[i]==""){
				 amount[i]="0";
			 }
			 num=Integer.parseInt(amount[i]);
			 Totalprice=price*num;
			 if(num==0){
				 pst2.setInt(1, Integer.parseInt(userid));
				 pst2.setInt(2, Integer.parseInt(bookid[i]));
				 pst2.addBatch();
			 }
			 else{
				 pst.setInt(1, num);
				 pst.setDouble(2, Totalprice);
				 pst.setInt(3, Integer.parseInt(bookid[i]));
				 pst.setInt(4, Integer.parseInt(userid));
				 pst.addBatch();
			 }
			   
			 i++;
			 
			 if(i==bookid.length)  break;		 
			 
		 }
		 pst.executeBatch();
		 pst2.executeBatch();
		 String path=request.getContextPath()+"/cart.jsp";
		 response.sendRedirect(path);
		 
		 ResultSet rr=stmt.executeQuery("select * from carts"); 
		 
		 if(rr!=null) 
		 rr.close(); 
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
