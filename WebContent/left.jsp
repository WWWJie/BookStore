
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<base target="mainFrame">

</head>
<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
	response.sendRedirect("login.jsp");
}
%>
<body>
<p><strong><a href="main.jsp"><font size="4">首页</font></a></strong></p>
<p><font size="4"><strong><a href="info.jsp">查看个人信息</a></strong></font></p>
<p><font size="4"><strong><a href="changeinfo.jsp">修改个人信息</a></strong></font></p>
<p><strong><font size="4"><a href="changePasswd.jsp">修改密码</a></font></strong></p>
<%

request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String username=(String)session.getAttribute("username");
if(username==null){
	
	
%>
<p><strong><font size="4"><a href="cart.jsp" target="_parent">购物车</a></font></strong></p>
<%}
else{
	
%>
<p><strong><font size="4"><a href="AddBook.jsp" >添加图书</a></font></strong></p>
<%} %>
<p><strong><font size="4"><a href="<%=request.getContextPath()%>/DelSessionServlet" target="_parent" >退出</a></font></strong></p>

</body>
</html>
