<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="mycss.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	/* if(document.form1.amount.value==""){
		alert("数量不能为空！！！");	
		return false;
	 } */

}
</script>
</head>
<%
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String userid=(String)session.getAttribute("userid"); 
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	 response.sendRedirect(path);	
}

ResultSet rs ;
rs = connDbBean.executeQuery("SELECT * FROM cart where userid="+userid);
	
%>
<body>

<table width="560" border="0" align="center">
 <tr>
      <td width="119">
      <div align="right">
<% if(userid==null){%> 
&nbsp;
<%} else{%>
<a href="index.jsp" >
<img src="image/user.jpg" width="52" height="54" border="0" /></a>
 <%} %>  
      </div>
      &nbsp;</td>
      <td width="438">&nbsp;&nbsp;&nbsp;<a href="orderlist.jsp" ><img src="image/order.gif" width="52" height="44" border="0" /></a></td>
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
    <td><div align="center" class="style2">购物车</div></td>
    <td>&nbsp;</td>
  </tr>
</table>
<form onsubmit="return mycheck()" id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/UpdateCartServlet"  >
<table width="560" border="0" align="center">
  <tr>
    <td colspan="5"><div align="center"><hr width="100%" size="1" color="#FE6702"></div></td>
  </tr>
  <tr bgcolor="#CE9ACE">
    <td width="282" height="25"><div align="center">商品名称</div></td>
    <td width="79"><div align="center">单价</div></td>
    <td width="45"><div align="center">数量</div></td>
    <td width="80"><div align="center">金额小计(￥)</div></td>
    <td width="52"><div align="center">&nbsp;</div></td>
  </tr>
  
  <%
  while(rs.next())
	{
  %>
  <tr>
    <td height="25" bgcolor="#FFF3E7"><div align="center">《<a href="bookinfo.jsp?bookid=<%=rs.getInt("bookid") %>" target="_blank"><%=rs.getString("bookname") %></a>》</div></td>
    <td bgcolor="#FFF3E7"><div align="center"><%=rs.getDouble("price") %></div></td>
    <td bgcolor="#FFF3E7"><div align="center">
      <input  name="amount" type="text" id="amount" value="<%=rs.getInt("amount") %>" size="4" /> 
      <input name="bookid" type="hidden" value="<%=rs.getInt("bookid") %>"></input>
    </div></td>
    <td bgcolor="#FFF3E7"><div align="center"><%=rs.getDouble("TotalPrice") %></div></td>
    <td bgcolor="#FFF3E7"><div align="center"><a href="<%=request.getContextPath()%>/DeleteCartServlet?bookid=<%=rs.getString("bookid") %>"><img src="image/del.gif" width="36" height="16" border="0" /></a></div></td>
  </tr>
  <%} %>
  
  <tr>
    <td colspan="5">
    <div align="center">
    <input name="imageField" type="image" src="image/update.gif" width="61" height="16" border="0" />&nbsp;&nbsp;
    <a href="<%=request.getContextPath()%>/ClearCartServlet"><img src="image/remove.gif" width="69" height="16"  border="0" /></a>
    </div>
    </td>
    </tr>
  <tr>
    <td colspan="5"><div align="center"><hr width="100%" size="1" color="#FE6702"></div></td>
    </tr>
  <tr>
    <td colspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5"><div align="center"><a href="list.jsp?Page=1"><img src="image/continue.gif" width="147" height="33" border="0" /></a>&nbsp;&nbsp;<a href="preorder.jsp"><img src="image/checkout.gif" width="147" height="33" border="0" /></a></div></td>
  </tr>
</table>
</form>

 
</body>
</html>
