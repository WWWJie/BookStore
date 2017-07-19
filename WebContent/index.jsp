<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
</head>
<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
	response.sendRedirect("login.jsp");
}
%>
<frameset rows="91*" cols="145,625">
    <frame src="left.jsp" name="leftFrame" frameborder="yes" scrolling="NO" noresize>
    <frame src="main.jsp" name="mainFrame" frameborder="yes">
</frameset>
<noframes><body>
</body></noframes>
</html>
