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
int PageSize = 10;
int Page = 1;
int totalPage = 1;
int totalrecord = 0;
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String userid=(String)session.getAttribute("username");
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	response.sendRedirect(path);	
}


	
%>
<body>

<table width="560" border="0" align="center" >
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
    <td><div align="center" class="style2">订单</div></td>
    <td></td>
    <td></td>
  </tr>
</table>
<form action="" method="post">

<table width="601" border="0" align="center" >
<tr >
<td width="35%">&nbsp;</td>
<td width="35%">&nbsp;</td>
<td width="25%"><input name="search" type="text" value=""></input></td>
<td>
<input name="imageField" type="image" src="image/search.jpg" width="45" height="36" border="0" /></td></tr>
</table>
</form>
<%
String search=request.getParameter("search");

ResultSet rs ;
String sql;
if(search==null){
	sql="SELECT * FROM orders order by createtime desc";
}
else{
	sql="SELECT * FROM orders where orderid='"+search+"' order by createtime desc";
}
rs = connDbBean.executeQuery(sql);
if(rs.next()){
	rs.last();   
    totalrecord = rs.getRow();//得到记录集的总记录数（总行数）；   
    rs.first();   
    }    
else{
	out.print("<h3>该订单不存在！</h3>");
}
	if(totalrecord % PageSize ==0)// 如果是当前页码的整数倍
		totalPage = totalrecord / PageSize; 
	else  // 如果最后还空余一页
		totalPage = (int) Math.floor( totalrecord / PageSize ) + 1; 
	if(totalPage == 0) totalPage = 1;
	if(request.getParameter("Page")==null || request.getParameter("Page").equals(""))
		Page = 1;
	else
	try {
		Page = Integer.parseInt(request.getParameter("Page"));
	}
    catch(java.lang.NumberFormatException e){
		// 捕获用户从浏览器地址拦直接输入Page=sdfsdfsdf所造成的异常
		Page = 1;
	}
	if(Page < 1)  Page = 1;
	if(Page > totalPage) Page = totalPage;
	rs.absolute((Page-1) * PageSize + 1);
%>
<br>
<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/AdminServlet">
<table width="601" border="1" cellspacing="0" align="center" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  <tr>
    <td colspan="5"><div align="center"><hr width="100%" size="1" color="#FE6702"></div></td>
  </tr>
  <tr bgcolor="#FFDBB5" align="center">
    <td width="17%" height="19">订单号</td>
    <td width="17%">用户编号</td>
    <td width="37%">下订时间</td>
    
    <td width="28%">处理状态</td>
  </tr>
  
  <%
  for(int iPage=1; iPage<=PageSize; iPage++)
	{
  %>
 <tr align="center" bgcolor="FFFFFF">
    <td height="18" ><%=rs.getInt("orderid")%></td>
    <td><%=rs.getString("userid")%> </td>
    <td><%=rs.getString("createtime")%> </td>
    
    <td><select name="status">
      <option value="<%=rs.getString("status")%>"><%=rs.getString("status")%></option>
      <option value="等待确认">等待确认</option>
      <option value="已确认，等待发货">已确认，等待发货</option>      
      <option value="已发货">已发货</option>
      <option value="已收货，订单完成">已收货，订单完成</option>
    </select>
    <input name="orderid" type="hidden" value="<%=rs.getInt("orderid") %>"></input>
    <!-- <input name="orderid1" type="text" value="hh"></input> -->
    </td>
    
  </tr>
  <%if(!rs.next()) break;} 
	
  %>
  <tr>
    <td colspan="5">
    <div align="center">
    <% 
   if(Page != 1) {
      out.print("   <A HREF=Admin1.jsp?Page=1>第一页</A>");
      out.print("   <A HREF=Admin1.jsp?Page=" + (Page-1) + ">上一页</A>");
   }
   if(Page != totalPage) {
      out.print("   <A HREF=Admin1.jsp?Page=" + (Page+1) + ">下一页</A>");
      out.print("   <A HREF=Admin1.jsp?Page=" + totalPage + ">最后一页</A>");
   }
%>
<BR>
页数:<font COLOR="Red"><%=Page%>/<%=totalPage%></font>
    
    </div>
    </td>
    </tr>
  <tr>
    <td colspan="5">
    <div align="center">
    <input name="imageField" type="image" src="image/status.GIF" width="100" height="36" border="0" />&nbsp;&nbsp;
    
    </div>
    </td>
    </tr>
  
</table>
</form>

 
</body>
</html>
