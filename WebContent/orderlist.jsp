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
String userid=(String)session.getAttribute("userid");
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	 response.sendRedirect(path);	
}
%>
<body>
<table width="601" border="0" align="center">
  <tr>
      <td width="119">
      <div align="right">
<% if(userid==null){%> 
&nbsp;
<%} else{%>
<a href="index.jsp" >
<img src="image/user.jpg" width="52" height="54" border="0" /></a>
 
      </div>
      &nbsp;&nbsp;&nbsp;</td>
      <td width="438"><a href="cart.jsp" >
<img src="image/cart.jpg" width="52" height="44" border="0" /></a>
 <%} %> </td>
      <td width="147"><div align="right">
<% if(userid==null){%> 
<a href="login.jsp" target="_parent">
<img src="image/login.gif" width="82" height="34" border="0" /></a>
<%} else{%>
<a href="<%=request.getContextPath()%>/DelSessionServlet" target="_parent">
<img src="image/logout.gif" width="82" height="34" border="0" /></a>
 <%} %>  
      </div></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center">此今为止，您所下过的订单：</div></td>
  </tr>
</table>
<table width="601"  border="1" cellspacing="0" align="center" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  <tr align="center" bgcolor="#FFDBB5">
    <td width="17%" height="19">订单号</td>
    <td width="37%">下订时间</td>
    <td width="28%">处理状态</td>
    <td width="18%">&nbsp;</td>
  </tr>

  <%
	ResultSet rs ;
	rs = connDbBean.executeQuery("SELECT * FROM orders WHERE userid = " + userid );
	while(rs.next()){
	
%>
  <tr align="center" bgcolor="FFFFFF">
    <td height="18" ><%=rs.getInt("orderid")%></td>
    <td><%=rs.getString("createtime")%> </td>
    <td><%=rs.getString("status")%></td>
    <td><a href="orderinfo.jsp?orderid=<%=rs.getInt("orderid")%>">详细</a></td>
  </tr>
  
<%} %>
  
  
  

</table>
<p align="center">
  <input name="back" type="button" class="button" value="返回图书目录" onclick="javascript:window.location.href='list.jsp'" />
</p>
  

</body>
</html>
