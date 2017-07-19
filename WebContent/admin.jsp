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
String userid=(String)session.getAttribute("username");
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
<img src="image/user.jpg" width="82" height="34" border="0" /></a>
 <%} %>  
      </div>
      &nbsp;</td>
      <td width="438">&nbsp;</td>
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
  <%
  request.setCharacterEncoding("GB2312");
  response.setContentType("text/html;charset=gb2312");
   
  %>
  <tr>
    <td colspan="3"><div align="center">此今为止，您所下过的订单：</div></td>
    
    <input  name="search" type="text" id="search"  size="4" />&nbsp;<input name="back" type="button" class="button" value="查询" >
    </input>
    
  </tr>
</table>
<table width="601"  border="1" cellspacing="0" align="center" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  <tr align="center" bgcolor="#FFDBB5">
    <td width="17%" height="19">订单号</td>
    <td width="37%">下订时间</td>
    <td width="28%">处理状态</td>

  </tr>

  <%
  String str = request.getParameter("search"); 
  ResultSet rs ;
  rs=connDbBean.executeQuery("SELECT * FROM orders ");
  /* if(str==null){
  	rs=connDbBean.executeQuery("SELECT * FROM orders ");
  }else{
  	rs = connDbBean.executeQuery("SELECT * FROM orders where orderid='"+str+"'");
  } */
	while(rs.next()){
	
%>
  <tr align="center" bgcolor="FFFFFF">
    <td height="18" ><%=rs.getInt("orderid")%></td>
    <td></td>
    <td><%=rs.getString("createtime")%> </td>
    <td><select name="status">
      <option value="<%=rs.getString("status")%>"><%=rs.getString("status")%></option>
      <option value="等待确认">等待确认</option>
      <option value="已确认，等待发货">已确认，等待发货</option>      
      <option value="已发货">已发货</option>
      <option value="已收货，订单完成">已收货，订单完成</option>
    </select>
    <input name="orderid" type="text" value="<%=rs.getInt("orderid") %>"></input>
    <input name="orderid1" type="text" value="hh"></input>
    </td>
    
  </tr>
  
<%} %>

  <p align="center">
<a href="<%=request.getContextPath()%>/AdminServlet">更新状态</a>
  
</p>
  
  

</table>

  

</body>
</html>
