<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="mycss.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
	String orderid=(String)session.getAttribute("orderid");
	String userid=(String)session.getAttribute("userid");
	if(userid==null){
		String path=request.getContextPath()+"/login.jsp";
		 response.sendRedirect(path);	
	}
	ResultSet rs ;
	rs = connDbBean.executeQuery("SELECT * FROM orders WHERE orderid = " + orderid );
	if(rs.next()){
		
	
	
%>




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
&nbsp;&nbsp;&nbsp;<a href="orderlist.jsp" ><img src="image/order.gif" width="52" height="44" border="0" /></a>
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
    <td colspan="3"><div align="center">感谢您在此购书，您的订单已经生效</div></td>
  </tr>
</table>
<table width="601"  border="1" align="center" cellspacing="0" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  <tr>
    <td height="24" colspan="2" align="center"><strong>以下为您此次订单的详细信息：</strong></td>
  </tr>
  <tr>
    <td width="26%" height="20"><div align="right">您的订单号：</div></td>
    <td width="74%"><strong><%=orderid %></strong>（请牢记此订单号，以便于你日后查询）</td>
  </tr>
  <%
  ResultSet rs1 = connDbBean.executeQuery("SELECT * FROM users WHERE userid = " + userid );
  if(rs1.next()){
  %>
  <tr>
    <td height="19"><div align="right">收货人姓名：</div></td>
    <td><%=rs1.getString("name") %></td>
  </tr>
  <tr>
    <td height="19"><div align="right">收货人地址：</div></td>
    <td><%=rs1.getString("address") %></td>
  </tr>
  <tr>
    <td height="19"><div align="right">收货人地址邮编：</div></td>
    <td><%=rs1.getString("postcode") %></td>
  </tr>
  <tr>
    <td height="19"><div align="right">收货人地址电话：</div></td>
    <td><%=rs1.getString("tel") %></td>
  </tr>
  <%} %>
  <tr>
    <td height="19"><div align="right">应付金额：</div></td>
    <td><%=rs.getDouble("TotalPrice") %></td>
  </tr>
  <tr>
    <td height="19"><div align="right">下订时间：</div></td>
    <td><%=rs.getString("createtime") %> </td>
  </tr>
  <%} %>
</table>
<div align="center"><br />
  <input type="button" name="Submit" value="查看订单列表" class="button" onclick="javascript:window.location.href='orderlist.jsp'"/>
</div>

</body>
</html>
