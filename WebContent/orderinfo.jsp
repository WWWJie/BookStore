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
<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	 response.sendRedirect(path);	
}
%>
<%String orderid=request.getParameter("orderid"); %>
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
    <td><div align="center"><strong>订单号：<span class="style3"><%=orderid %></span></strong></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br>
<table width="601" border="0" align="center" cellspacing="1">
  <tr>
    <td colspan="4"><div align="left"><strong>收货人信息</strong></div></td>
  </tr>
  <%
	ResultSet rs ;
	rs = connDbBean.executeQuery("SELECT * FROM users WHERE userid = " + userid );
	if(rs.next()){
	
%>
  <tr>
    <td width="51" bgcolor="#EFEFFF"><div align="left">姓名：</div></td>
    <td width="520" bgcolor="#EFEFFF"><div align="left"><%=rs.getString("name") %></div></td>
    <td width="50" bgcolor="#EFEFFF"><div align="left">邮编：</div></td>
    <td width="89" bgcolor="#EFEFFF"><div align="left"><%=rs.getString("postcode") %></div></td>
  </tr>
  <tr>
    <td bgcolor="#EFEFFF">地址：</td>
    <td bgcolor="#EFEFFF"><%=rs.getString("address") %></td>
    <td bgcolor="#EFEFFF">电话：</td>
    <td bgcolor="#EFEFFF"><%=rs.getString("tel") %></td>
  </tr>
  <%} %>
  <tr>
    <td colspan="4"><hr width="100%" size="1" color="#000000"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="601" border="0" align="center">
  <tr>
    <td colspan="4"><div align="left"><strong>您所购买商品的货物清单</strong></div></td>
  </tr>
  <tr>
    <td width="375" bgcolor="#EFEFFF"><div align="left">商品名称</div></td>
    <td width="54" bgcolor="#EFEFFF"><div align="left">单价</div></td>
    <td width="60" bgcolor="#EFEFFF"><div align="left">数量</div></td>
    <td width="94" bgcolor="#EFEFFF"><div align="left">金额小计(￥)</div></td>
  </tr>
  <%
  
	ResultSet rs1 ;
	rs1 = connDbBean.executeQuery("SELECT * FROM orderdetail WHERE orderid = " + orderid);
	//out.print("SELECT * FROM orderdetail WHERE orderid = " + orderid);
	//out.print("total:"+rs1.getDouble("totalprice"));
	while(rs1.next()){
		ResultSet rs2 ;
		rs2 = connDbBean.executeQuery("SELECT * FROM book WHERE bookid = " + rs1.getInt("bookid") );
%>
  <tr>
    <td bgcolor="#EFEFFF">《<a href="bookinfo.jsp?bookid=<%=rs1.getInt("bookid") %>" target="_blank"><%if(rs2.next()){ out.print(rs2.getString("bname"));%> </a>》</td>
    <td bgcolor="#EFEFFF"><%=rs2.getDouble("price") %></td><%} %>
    <td bgcolor="#EFEFFF"><%=rs1.getInt("amount") %></td>
    <td bgcolor="#EFEFFF"><div align="right"><%=rs1.getDouble("totalprice") %></div></td>
  </tr>
  <%} %>
  
  
  <%
    
	ResultSet rs3 ;
	rs3 = connDbBean.executeQuery("SELECT * FROM orders WHERE orderid = " + orderid );
	if(rs3.next()){
		
%>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><div align="right"><strong>订单总金额：</strong></div></td>
    <td><div align="right"><%=rs3.getDouble("TotalPrice") %></div></td>
  </tr>
  <tr>
    <td colspan="4"><hr width="100%" size="1" color="#000000"></td>
  </tr>
</table>
<table width="601" border="0" align="center">
  <tr>
    <td width="155"><strong>下单时间：</strong></td>
    <td valign="middle">&nbsp;</td>
  </tr>
  <tr bgcolor="#EFEFFF">
    <td colspan="2"><div align="left"><%=rs3.getString("createtime") %></div>
      <div align="left"></div>      <div align="left"></div></td>
    </tr>
    <%} %>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
	  <input name="back" type="button" class="button" value="返回订单列表" onClick="history.back();">
    </div></td>
  </tr>
</table>

</body>
</html>
