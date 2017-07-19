<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	
	 if(document.form1.textfield.value==""){
		 alert("请输入密码");
		 return false;
	 }
	 else if(document.form1.textfield2.value==""){
		 alert("请再一次输入密码");
		 return false;
	 }	 
	 else if(document.form1.textfield.value!==document.form1.textfield2.value){
		//document.form1.message.value="请输入用户名";
		alert("密码与确认密码不同!");
		return false;		
	 }	 

}
</script>
</head>
<%
String userid=(String)session.getAttribute("userid");
if(userid==null){
	response.sendRedirect("login.jsp");
}
%>
<body>
<form onSubmit="return mycheck()" action="<%=request.getContextPath()%>/UpdateServlet" method="post"  id="form1" name="form1">
<table width="387" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF0000" bordercolorlight="#FF0000" bordercolordark="#FFFFFF">
  <tr>
    <td width="112" bgcolor="#CCFF66"><font size="5" face="隶书">新密码:</font></td>
    <td width="261"><font size="5">
      <input type="password" name="textfield" style=width:165pt; maxlength="50">
    </font></td>
  </tr>
  <tr>
    <td bgcolor="#CCFF66"><font size="5" face="隶书">密码确认:</font></td>
    <td><font size="5">
      <input type="password" name="textfield2" style=width:165pt; maxlength="50">
    </font></td>
  </tr>
  <tr>
    <td colspan="2" ><div align="center">
        <input type="submit" name="Submit" value="提交"> 
    </div></td>
  </tr>  
</table>
</form>
</body>
</html>
