<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="mycss.css" rel="stylesheet" type="text/css" />
</head>
<%
String bookid=request.getParameter("bookid");
	ResultSet rs ;
	rs = connDbBean.executeQuery("SELECT * FROM book WHERE bookid = " + bookid );
	if(rs.next()){
	
%>
<body>


<table width="601" align="center"  border="1" cellpadding="0" cellspacing="0" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  <tr bgcolor="#ECECFF">
    <td height="32" colspan="2"  align="center" valign="middle">图书详细信息</td>
  </tr>
  <tr>
    <td width="18%" height="25" align="right">ISBN：</td>
    <td width="82%"><%=rs.getString("isbn") %></td>
  </tr>
  <tr>
    <td height="24" align="right">书名：</td>
    <td> 《<font color="#0000FF"><%=rs.getString("bname") %></font>》</td>
  </tr>
  <tr>
    <td height="24" align="right">作者：</td>
    <td><%=rs.getString("author") %></td>
  </tr>
  <tr>
    <td height="23" align="right">出版社：</td>
    <td><%=rs.getString("publisher") %></td>
  </tr>
  <tr>
    <td height="25" align="right">出版日期：</td>
    <td><%=rs.getString("year") %></td>
  </tr>
  <tr>
    <td height="24" align="right">单价：</td>
    <td><%=rs.getDouble("price") %></td>
  </tr>
  <tr>
    <td height="24" align="right">简介：</td>
 
    <td><%=rs.getString("abstracts") %></td>
  </tr>
</table>


</body>
<%} %>
</html>
