<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	if(document.form1.username.value==""){
		alert("请输入用户名");	
		return false;
	 }
	
	else if(document.form1.passwd1.value==""){
		 alert("请输入密码");	
		 return false;
	 }
	else if(document.form1.passwd2.value==""){
		 alert("请再一次输入密码");
		 return false;		
	 }
	else if(document.form1.passwd1.value!==document.form1.passwd2.value){
		alert("密码与确认密码不同!");		
		return false;
	 }
	else if(document.form1.name.value==""){
		alert("请输入姓名");	
		return false;
 	}
	else if(document.form1.address.value==""){
		 alert("请输入地址");	
		 return false;
	 }
	else if(document.form1.postcode.value==""){
		 alert("请输入邮编");
		 return false;
	 }
	else if(document.form1.tel.value==""){
		 alert("请输入电话");	
		 return false;
	 }

}
</script>

</head>

<body>
<div align="center">
<p><font size="+7" face="隶书" color="#FE6702">会员注册</font></p>
<form onSubmit="return mycheck()" action="<%=request.getContextPath()%>/RegisterServlet" method="post" name="form1"  id="form1" >
<table width="520" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="2"><div align="center">
      <hr width="95%" size="1" color="#FE6702">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">用户名:</div></td>
    <td><div align="left">
      <input type="text" name="username"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right">密码:</div></td>
    <td><input name="passwd1" type="password"  style=width:165pt; maxlength="50"></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right">密码确认:</div></td>
    <td><input name="passwd2" type="password"  style=width:165pt; maxlength="50" ></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">姓名:</div></td>
    <td><div align="left">
      <input type="text" name="name"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">地址:</div></td>
    <td><div align="left">
      <input type="text" name="address"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">邮编:</div></td>
    <td><div align="left">
      <input type="text" name="postcode"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">电话:</div></td>
    <td><div align="left">
      <input type="text" name="tel"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="right"></div>      
    <div align="center">
      <hr width="95%" size="1" color="#FE6702">
    </div></td>
  </tr>
  <tr height="4px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  
  <tr>
    <td colspan="2"><div align="right"></div>      
    <div align="center">
      <input type="submit" name="Submit" value="提交">
    &nbsp;
    <input type="reset" name="Submit" value="重置">
    </div></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
