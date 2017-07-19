<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Refresh" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String bookid = request.getParameter("bookid");
String userid=(String)session.getAttribute("userid");
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	 response.sendRedirect(path);	
}
String bookname=null;
Double price=0.0;
ResultSet rs1 ;


rs1 = connDbBean.executeQuery("SELECT * FROM book where bookid='"+bookid+"'");
if (rs1.next()){  
	bookname=rs1.getString("bname");
	price=rs1.getDouble("price");
	
}
Connection conn = null; 
Statement stat = null; 
ResultSet rs = null;
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/bookstore";
String user = "root"; 
String password = "123456";	
try{	 
	conn = DriverManager.getConnection(url, user, password);
	stat = conn.createStatement();
String sql = "insert into cart(userid,bookid,bookname,price,amount,TotalPrice) values('" + userid + "','"+ bookid + "','" 
+ bookname + "'," + price + "," + 1 + "," + price +")";
stat.executeUpdate(sql);  
rs = stat.executeQuery("select * from cart"); 
}
catch(Exception e){} 
%>
<center>
   <%
    try{
     
     
    if(rs.next())
    {
    	String path1=request.getContextPath()+"/cart.jsp";
		response.sendRedirect(path1);
    }
    else{
    out.print("<br><h3>输入失败！</h3>");
    }
  }
  catch(Exception e){}
    %> 
   
    
      <br>
    
    </center>
     <%
    if(rs != null)
    {
        rs.close();
        rs = null;
    }
        if(stat != null)
    {
        stat.close();
        stat = null;
    }
        if(conn != null)
    {
        conn.close();
        conn = null;
    }
    %>      

<!-- <a href="BookInfo.jsp"><input type="button" value="查看"></input></a> -->
</body>
</html>