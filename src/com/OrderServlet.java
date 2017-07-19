package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import db.dbconnBook;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(); 
		String userid=(String)session.getAttribute("userid");
		if(userid==null){
			String path=request.getContextPath()+"/login.jsp";
			 response.sendRedirect(path);	
		}
		
		Date date=new Date();
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time=format.format(date);
		out.print("<br>time:"+time);
		String message=request.getParameter("message");
		out.print("<br>message:"+message);
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		try { 
		 Connection conn=dbconnBook.getMySqlConnection();
		 Statement stmt=conn.createStatement(); 
		 ResultSet rs=stmt.executeQuery("select * from cart where userid='" + userid+"'" ); 
		 double total=0.0;
		 double total1=0.0;
		 
		 while(rs.next()){
				 total1=rs.getDouble("TotalPrice");
				 out.print("<br>total1:"+total1);
				 total+=total1;
				 
			 }
		 ResultSet r1=stmt.executeQuery("select * from cart where userid='" + userid+"'" ); 
		 if(r1.next()){
			 
			 String sql = "insert into orders(userid,createtime,status,message,TotalPrice) values('" + userid + "','"+ time + 
					 "','等待确认','"+ message +"','"+total+"')";
			 out.print(sql);
			 stmt.executeUpdate(sql);  
			 
		 
		 int orderid=0;
		 ResultSet rs1=stmt.executeQuery("select * from orders where userid='" + userid+"' and createtime='"+time+"'" ); 
		 if(rs1.next()){
			 orderid=rs1.getInt("orderid"); 
			 session.setAttribute("orderid", orderid+"");
			 
		 }
		 ResultSet r=stmt.executeQuery("select * from cart where userid='"+userid+"'");
		 int bookid;
		 int amount;
		 double totalprice;
		 PreparedStatement pst1 = null;
		 String sql1 = "insert into orderdetail (orderid,bookid,amount,totalprice) values(?,?,?,?)";
		 pst1=conn.prepareStatement(sql1);
		 PreparedStatement pst2 = null;
		 String sql2="delete from cart where userid=? and bookid=?";
		 pst2=conn.prepareStatement(sql2);
		 while(r.next()){				 			 
			 bookid=r.getInt("bookid");
			 amount=r.getInt("amount");
			 totalprice=r.getDouble("totalprice");
			 out.print(bookid);
			 pst1.setInt(1, orderid);
			 pst1.setInt(2, bookid);
			 pst1.setInt(3, amount);
			 pst1.setDouble(4, totalprice);
			 pst1.addBatch(); 
			 
			 pst2.setString(1, userid);
			 pst2.setInt(2, bookid);
			 pst2.addBatch();
			 
		 }
		 pst1.executeBatch();
		 pst2.executeBatch();
		 String path2=request.getContextPath()+"/neworderinfo.jsp";
		 response.sendRedirect(path2);
		 /*ResultSet rs2 = stmt.executeQuery("select * from orders"); 
		 ResultSet rs3 = stmt.executeQuery("select * from orderdetails");
		 if(rs2!=null && rs3!=null){
			 rs2.close();
			 rs3.close();
		 }
		  
		 if(stmt!=null) 
		 stmt.close(); 
		 if(conn!=null) 
		 conn.close();*/
		 }
		 else{
			 out.print("<script Lanuage='javascript'>window.alert('您的购物车中没有商品，请前往选购！！')</script>");
			 out.write("<script language='javascript'>alert('您的购物车中没有商品，请前往选购！！')</script>");
			 out.print("xxxx");
			 String path=request.getContextPath()+"/list.jsp";
			 response.sendRedirect(path);
			
		 }
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
