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
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
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
    <td><div align="center">订购信息</div></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br>
<table width="601" border="0" align="center" cellspacing="1">
  <tr>
    <td colspan="3"><div align="left"><strong>收货人信息</strong></div></td>
    <td><div align="right"><a href="orderlist.jsp" target="_blank">历史订单</a></div></td>
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
    <td colspan="4"><div align="left"><strong>您所购买商品的货物清单</strong><a href="cart.jsp">修改购物清单</a></div></td>
  </tr>
  <tr>
    <td width="367" bgcolor="#EFEFFF"><div align="left">商品名称</div></td>
    <td width="62" bgcolor="#EFEFFF"><div align="left">单价</div></td>
    <td width="55" bgcolor="#EFEFFF"><div align="left">数量</div></td>
    <td width="99" bgcolor="#EFEFFF"><div align="left">金额小计(￥)</div></td>
  </tr>
  <%
	ResultSet rs1 ;
	rs1 = connDbBean.executeQuery("SELECT * FROM cart WHERE userid = " + userid );
	Double sumprice=0.0;
	while(rs1.next()){
	
%>
	<tr>
    <td width="367" bgcolor="#EFEFFF"><div align="left"><%=rs1.getString("bookname") %></div></td>
    <td width="62" bgcolor="#EFEFFF"><div align="left"><%=rs1.getDouble("price") %></div></td>
    <td width="55" bgcolor="#EFEFFF"><div align="left"><%=rs1.getInt("amount") %></div></td>
    <td width="99" bgcolor="#EFEFFF"><div align="left"><%=rs1.getDouble("TotalPrice") %></div></td>
  </tr>
  <%
  sumprice+=rs1.getDouble("TotalPrice");
	}
  %>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><div align="right"><strong>订单总金额：</strong></div></td>
    <td><div align="right"><%=sumprice %></div></td>
  </tr>
  <tr>
    <td colspan="4"><hr width="100%" size="1" color="#000000"></td>
  </tr>
</table>
<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/OrderServlet">
<table width="601" border="0" align="center">
  <tr bgcolor="#EFEFFF">
    <td width="155"><div align="left">购物留言</div></td>
    <td width="366" valign="middle" bgcolor="#EFEFFF"><div align="left">
        <textarea name="message" cols="50" rows="7"></textarea>
    </div></td>
    <td width="183" align="left" valign="middle" bgcolor="#EFEFFF"><div align="left">（不超过1000字）</div></td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center">
      <input name="Submit" type="submit" class="button" value="确认并提交" />
    </div></td>
  </tr>
</table>
</form>
</body>
</html>
