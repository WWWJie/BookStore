<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="connDbBean"  scope="page"  class="db.dbconnBook"></jsp:useBean>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�ޱ����ĵ�</title>
<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	
	
	if(document.form1.name.value==""){
		alert("����������");	
		return false;
 	}
	else if(document.form1.address.value==""){
		 alert("�������ַ");	
		 return false;
	 }
	else if(document.form1.postcode.value==""){
		 alert("�������ʱ�");
		 return false;
	 }
	else if(document.form1.tel.value==""){
		 alert("������绰");	
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
ResultSet rs ;
rs = connDbBean.executeQuery("SELECT * FROM users where userid="+userid);
if(rs.next()){
	
%>
<body>
<form onSubmit="return mycheck()" action="<%=request.getContextPath()%>/UpdateInfoServlet" method="post" o id="form1" name="form1">
<table width="387" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF0000" bordercolorlight="#FF0000" bordercolordark="#FFFFFF">
  <tr>
    <td width="112" bgcolor="#CCFF66"><font size="5" face="����">����:</font></td>
    <td width="261"><font size="5">
    <input  name="name" type="text" id="name" value="<%=rs.getString("name") %>" style=width:165pt; maxlength="50" />
      
    </font></td>
  </tr>
  <tr>
    <td width="112" bgcolor="#CCFF66"><font size="5" face="����">��ַ:</font></td>
    <td width="261"><font size="5">
    <input  name="address" type="text" id="address" value="<%=rs.getString("address") %>" style=width:265pt; maxlength="80" />
      
    </font></td>
  </tr>
  <tr>
    <td width="112" bgcolor="#CCFF66"><font size="5" face="����">�ʱ�:</font></td>
    <td width="261"><font size="5">
    <input  name="postcode" type="text" id="postcode" value="<%=rs.getString("postcode") %>" style=width:165pt; maxlength="50" />
      
    </font></td>
  </tr>
  <tr>
    <td width="112" bgcolor="#CCFF66"><font size="5" face="����">�绰:</font></td>
    <td width="261"><font size="5">
    <input  name="tel" type="text" id="tel" value="<%=rs.getString("tel") %>" style=width:165pt; maxlength="50" />
      
    </font></td>
  </tr>
  <%} %>
  <tr>
    <td colspan="2" ><div align="center">
        <input type="submit" name="Submit" value="�ύ"> 
    </div></td>
  </tr>  
</table>
</form>
</body>
</html>
