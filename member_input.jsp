<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
</head>
<body>

<script language = "JavaScript">
function Check_id() 
{
	browsing_window = window.open("checkid.jsp?a_id="+form1.a_id.value, "_idcheck","height=100,width=300, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
}
</script>
<center>
<H2>ȸ������ </H2>
<HR>
</center>
<form name=form1 method=post action=member_output.jsp>
<table cellpadding=5 cellspacing=0 border="1" align="center">
  <tr>
    <td bgcolor="#99CCFF">���̵�</td>
    <td>
           <input type="text" name="a_id" size="20">
    	   <input type="button" OnClick='Check_id()' value='ID �ߺ��˻�'>
    </td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">�̸�</td>
    <td><input type="text" name="a_name" size="20"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">��й�ȣ</td>
    <td><input type="text" name="a_passwd" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">��ȭ��ȣ </td>
    <td><input type="text" name="a_tel" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">e-mail</td>
    <td><input type="text" name="a_email" size="30"></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" name="submit_join" value="ȸ������">
		<input type="reset" name="reset" value="����">
	</td>
  </tr>
</table>
</form>
<center>
<a href="login_form.html">�α��� </a>
</center>
</body>
</html>