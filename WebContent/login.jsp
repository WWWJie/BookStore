<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>

<link href="mycss.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	 if(document.form1.username.value==""){
		document.form1.message.value="请输入用户名";
		return false;		
	 }

	 if(document.form1.password.value==""){
		document.form1.message.value="请输入密码";
		return false;		
	 }

}
</script>
</head>

<body>

<form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/LoginServlet" onSubmit="return mycheck()">
<table width="286"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#FFDBB5" bordercolorlight="#FFFFFF" bordercolordark="#FFDBB5">
  <tr align="center" valign="middle" bgcolor="#FFDBB5">
    <td height="22" colspan="2" bordercolor="#FFDBB5" bordercolorlight="#FFDBB5" bordercolordark="#FFDBB5">会员登陆</td>
  </tr>
  <tr>
    <td width="24%"><div align="right">会员名</div></td>
    <td width="76%" align="center"><div align="left">
      &nbsp;<input name="username" type="text" size="25" style=width:110pt; maxlength="50"/>
    </div></td>
  </tr>
  <tr>
    <td width="24%"><div align="right">密码</div></td>
    <td align="center"><div align="left">
      &nbsp;<input name="password" type="password" size="25" style=width:110pt; maxlength="50"/>
    </div></td>
  </tr>
</table>
  <br />
  <div align="center">
    <input name="Submit" type="submit" class="button" value="登录" />
     <p>
    <input name="message" type="text" style="color:#FF0000;border-left:0px;border-top:0px;border-right:0px;border-bottom:0px;overflow-y:hidden;overflow-x:hidden;text-align: center;" value="" size="50">
  </p>
  </div>
</form>
<p align="center"><a href="register.jsp" ><img src="image/register.gif" width="156" height="30" /></a></p>


</body>
</html>
