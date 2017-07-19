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

import org.apache.jasper.tagplugins.jstl.core.Out;

import db.dbconnBook;

/**
 * Servlet implementation class AddToCarServlet
 */
@WebServlet("/AddToCarServlet")
public class AddToCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCarServlet() {
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
		
		String bookid=request.getParameter("bookid");
		HttpSession session = request.getSession(); 
		String userid=(String)session.getAttribute("userid");
		if(userid==null){
			String path=request.getContextPath()+"/login.jsp";
			 response.sendRedirect(path);	
		}
		String bookname=null;
		Double price=0.0;
		
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		try { 
		
			Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 ResultSet rs=stmt.executeQuery("select * from book where bookid='" + bookid +  "'"); 
		 
		 if(rs.next()){			 
			 bookname=rs.getString("bname");
			 price=rs.getDouble("price");
			 ResultSet rscart=stmt.executeQuery("select * from cart where bookid=" + bookid +  " and userid="+userid); 
			 if(rscart.next()){
				 int amount=rscart.getInt("amount")+1;
				 Double total=amount*rscart.getDouble("price");
				 String sql1 = "update cart set amount="+amount+", TotalPrice="+total+" where userid=" + userid + " and bookid="+bookid;
				 stmt.executeUpdate(sql1);  
			 }
			 else{
				 String sql = "insert into cart(userid,bookid,bookname,price,amount,TotalPrice) values(" + userid + ","+ bookid + ",'" 
					 + bookname + "'," + price + "," + 1 + "," + price +")";
				 stmt.executeUpdate(sql);  
			 }
			 String path=request.getContextPath()+"/cart.jsp";
			 response.sendRedirect(path);
			 
		 }
		 else{
				 out.print("<br><h3>该图书不存在</h3>");
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
