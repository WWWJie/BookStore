<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" pageEncoding="GB2312">
<title>无标题文档</title>
</head>
<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
	response.sendRedirect("login.jsp");
}
%>
<body>
<div align="center">
  <p><font size="+7" face="隶书">欢迎 </font></p>
  <p><img src="slide0012_image013.jpg" width="401" height="300"></p>
</div>
</body>
</html>
