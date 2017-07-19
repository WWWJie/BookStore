<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<script language="JavaScript" type="text/JavaScript">
function mycheck(){
	if(document.form1.ISBN.value==""){
		alert("请输入ISBN");	
		return false;
	 }
	else if(document.form1.bookname.value==""){
		alert("请输入书名");	
		return false;
 	}
	else if(document.form1.author.value==""){
		 alert("请输入作者");	
		 return false;
	 }
	else if(document.form1.publisher.value==""){
		 alert("请输入出版社");
		 return false;		
	 }
	
	else if(document.form1.year.value==""){
		 alert("请输入年份");	
		 return false;
	 }
	else if(document.form1.price.value==""){
		 alert("请输入价格");
		 return false;
	 }
	else if(document.form1.abstracts.value==""){
		 alert("请输入简介");	
		 return false;
	 }

}
</script>

</head>
<%

request.setCharacterEncoding("GB2312");
response.setContentType("text/html;charset=gb2312");
String userid=(String)session.getAttribute("username");
if(userid==null){
	String path=request.getContextPath()+"/login.jsp";
	response.sendRedirect(path);	
}
	
%>
<body>
<div align="center">
  <p><font size="+7" face="隶书" color="#FE6702">添加图书</font></p>
  

<form onSubmit="return mycheck()" action="<%=request.getContextPath()%>/AddBookServlet" method="post" name="form1"  id="form1" >
<table width="520" border="0" cellspacing="0" cellpadding="0">
  
  <tr>
    <td colspan="2"><div align="center">
      <hr width="95%" size="1" color="#FE6702">
    </div></td>
  </tr>
  <tr height="7px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">ISBN:</div></td>
    <td><div align="left">
      <input type="text" name="ISBN"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right">书名:</div></td>
    <td><input name="bookname" type="text"  style=width:165pt; maxlength="50"></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td><div align="right">作者:</div></td>
    <td><input name="author" type="text"  style=width:165pt; maxlength="50" ></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">出版社:</div></td>
    <td><div align="left">
      <input type="text" name="publisher"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">年份:</div></td>
    <td><div align="left">
      <input type="text" name="year"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">价格:</div></td>
    <td><div align="left">
      <input type="text" name="price"  style=width:165pt; maxlength="50">
    </div></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td width="163"><div align="right">简介:</div></td>
    <td><div align="left">
      <textarea name="abstracts" rows="6" style=width:165pt;></textarea>
    </div></td>
  </tr>
  <tr height="5px">
  <td>&nbsp;</td><td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="right"></div>      
    <div align="center">
      <hr width="95%" size="1" color="#FE6702">
    </div></td>
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
