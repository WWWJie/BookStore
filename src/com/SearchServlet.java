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

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		
		String search=request.getParameter("search");
		HttpSession session = request.getSession(); 
		
		
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost:3306/j2ee_7";
		String user = "root"; 
		String password = "123456";	
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("<HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		
		try { 
		 Class.forName(driver); 
		 Connection conn=DriverManager.getConnection(url,user,password); 
		 Statement stmt=conn.createStatement(); 
		 ResultSet rs=null;
		 String sql=null;
		 
		 if(search==null){
			 sql="select * from orders order by createtime desc";
		 }
		 else{
			 sql="select * from orders where userid="+search+" order by createtime desc";
		 }
		 rs=stmt.executeQuery(sql); 
		 if(rs.next()){
			 
				 //session.setAttribute("user", username);
				 String path=request.getContextPath()+"/index.jsp";
				 response.sendRedirect(path);			  
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
		 } catch (ClassNotFoundException e) { 
		  // TODO Auto-generated catch block  
		 e.printStackTrace();
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
