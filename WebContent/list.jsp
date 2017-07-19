<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.sql.*" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="mycss.css" rel="stylesheet" type="text/css" />
</head>
<%
int PageSize = 4;
int Page = 1;
int totalPage = 1;
int totalrecord = 0;
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String userid=(String)session.getAttribute("userid"); 
String username=(String)session.getAttribute("username");

	

	
%>
<body>
<div align="center">
<form action="" method="post">
  <table width="718" border="0">
    <tr>
      <td width="119">
      <div align="right">
<% if(userid==null){%> 
</td>
<td width="90">

&nbsp;&nbsp;&nbsp;</td>
<%} else{%>
<a href="index.jsp" >
<img src="image/user.jpg" width="52" height="54" border="0" /></a>&nbsp;&nbsp;
<a href="cart.jsp" >
<img src="image/cart.jpg" width="52" height="44" border="0" /></a> 
      </div>
      &nbsp;&nbsp;&nbsp;</td>
      <td width="90">
&nbsp;&nbsp;<a href="orderlist.jsp" ><img src="image/order.gif" width="52" height="44" border="0" /></a></td>
 

 <%} %> 
 	<td width="238"></td>
      <td width="147"><div align="right">
<% if(userid==null){%> 
<a href="login.jsp" >
<img src="image/login.gif" width="82" height="34" border="0" /></a>
<%} else{%>
<a href="<%=request.getContextPath()%>/DelSessionServlet" target="_parent">
<img src="image/logout.gif" width="82" height="34" border="0" /></a>
 <%} %>  
      </div></td>
    </tr>
    <tr>      
		<td ><input name="search" type="text" value=""></input></td>
		<td>
			<input name="imageField" type="image" src="image/search.jpg" width="45" height="36" border="0" /></td>
    	<td><div align="left" class="style1">图书信息</div></td>
      	<td>&nbsp;</td>
    </tr>
  </table><br>
 
  <table width="718" border="1" cellspacing="0" bordercolor="#0066FF" bordercolorlight="#0066FF" bordercolordark="#FFFFFF">
  
    <tr bgcolor="#ECECFF">
      <td width="547"><div align="center">书名，作者</div></td>
      <td width="85"><div align="center">单价(￥)</div></td>
      <td width="120"><div align="center">&nbsp;</div></td>
    </tr>
	<%
	String bookname=request.getParameter("search");
	String sql;
	if(bookname==null){
		sql="SELECT * FROM book ";
	}
	else{
		sql="SELECT * FROM book where bname LIKE '%"+bookname+"%'";
		
	}
	ResultSet rs ;
	rs = connDbBean.executeQuery(sql);
	if (rs.next()){   
	    rs.last();   
	    totalrecord = rs.getRow();//得到记录集的总记录数（总行数）；   
	    rs.first();   
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
  for(int iPage=1; iPage<=PageSize; iPage++)
	{
  %>
    <tr>
      <td><div align="left">《<a href="bookinfo.jsp?bookid=<%=rs.getString("bookid") %>" target="_blank"><%=rs.getString("bname") %></a>》<%=rs.getString("author") %></div></td>
      <td><div align="center"><%=rs.getString("price") %></div></td>
      <td><div align="center"><a href="<%=request.getContextPath()%>/AddToCarServlet?bookid=<%=rs.getString("bookid") %>"><img src="image/addcart.gif" width="92" height="21" border="0" /></a></div></td>
    </tr>
<%
if(!rs.next()) break;
	} %>
    
    
  </table></form><br>

<%
if(Page==1){
%>
<font size=1>1</font> <font size=1><A HREF=list.jsp?Page=2>2</A></font> <font size=1><A HREF=list.jsp?Page=3>3</A></font> <font size=1><A HREF=list.jsp?Page=4>4</A></font> <font size=1><A HREF=list.jsp?Page=5>5</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage %>>&gt;&gt;</A></font>
<%} 
else if(Page==2){
%>
<font size=1><A HREF=list.jsp?Page=1>1</A></font><font size=1> 2</font>  <font size=1><A HREF=list.jsp?Page=3>3</A></font> <font size=1><A HREF=list.jsp?Page=4>4</A></font> <font size=1><A HREF=list.jsp?Page=5>5</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage %>>&gt;&gt;</A></font>
<%}
else if(Page==3){
%>
<font size=1><A HREF=list.jsp?Page=1>1</A></font>  <font size=1><A HREF=list.jsp?Page=2>2</A></font><font size=1> 3</font> <font size=1><A HREF=list.jsp?Page=4>4</A></font> <font size=1><A HREF=list.jsp?Page=5>5</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage %>>&gt;&gt;</A></font>
<%}
else if(Page==totalPage){
%>
<font size=1><A HREF=list.jsp?Page=1>&lt;&lt;</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-4 %>><%=totalPage-4 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-3 %>><%=totalPage-3 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-2 %>><%=totalPage-2 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-1 %>><%=totalPage-1 %></A></font> <font size=1><%=totalPage %></font>
<%} 
else if(Page==totalPage-1){
%>
<font size=1><A HREF=list.jsp?Page=1>&lt;&lt;</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-4 %>><%=totalPage-4 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-3 %>><%=totalPage-3 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-2 %>><%=totalPage-2 %></A></font> <font size=1><%=totalPage-1 %></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage %>><%=totalPage %></A></font>
<%}
else if(Page==totalPage-2){
%>
<font size=1><A HREF=list.jsp?Page=1>&lt;&lt;</A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-4 %>><%=totalPage-4 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-3 %>><%=totalPage-3 %></A></font> <font size=1><%=totalPage-2 %></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage-1 %>><%=totalPage-1 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=totalPage %>><%=totalPage %></A></font>
<%}
else{
%>	
<font size=1><A HREF=list.jsp?Page=1>&lt;&lt;</A></font> <font size=1><A HREF=list.jsp?Page=<%=Page-2 %>><%=Page-2 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=Page-1 %>><%=Page-1 %></A></font> <font size=1><%=Page%></font> <font size=1><A HREF=list.jsp?Page=<%=Page+1 %>><%=Page+1 %></A></font> <font size=1><A HREF=list.jsp?Page=<%=Page+2 %>><%=Page+2 %></A></font><font size=1><A HREF=list.jsp?Page=<%=totalPage %>>&gt;&gt;</A></font>

<%} %>
</div>
</body>
</html>

