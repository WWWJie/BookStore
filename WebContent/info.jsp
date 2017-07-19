<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>无标题文档</title>
</head>
<%
request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String userid=(String)session.getAttribute("userid");
if(userid==null){
	response.sendRedirect("login.jsp");
}
else{
	ResultSet rs ;
	rs = connDbBean.executeQuery("SELECT * FROM users WHERE userid = " + userid  );
	if(rs.next()){
	
%>
<body>
<table width="423" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF0000" bordercolorlight="#FF0000" bordercolordark="#FFFFFF">

  <tr>
    <td width="121" bgcolor="#CCFF66"><font size="5" face="隶书">用户名:</font></td>
    <td width="288"><font size="5"><%=rs.getString("username") %></font></td>
  </tr>
  <tr>
    <td bgcolor="#CCFF66"><font size="5" face="隶书">姓名:</font></td>
    <td><font size="5"><%=rs.getString("name") %></font></td>
  </tr>
  <tr>
    <td bgcolor="#CCFF66"><font size="5" face="隶书">Address:</font></td>
    <td><font size="5"><%=rs.getString("address") %></font></td>
  </tr>
  <tr>
    <td bgcolor="#CCFF66"><font size="5" face="隶书">邮编:</font></td>
    <td><font size="5"><%=rs.getString("postcode") %></font></td>
  </tr>
  <tr>
    <td bgcolor="#CCFF66"><font size="5" face="隶书">电话:</font></td>
    <td><font size="5"><%=rs.getString("tel") %></font></td>
  </tr>
  
  
</table>
</body>
<%} }%>
</html>
