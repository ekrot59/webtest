<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  errorPage="rides_error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̱ⱸ ��� ȭ��</title>
</head>
<body>
<center>
<h2>���̱ⱸ ���</h2>
<hr>
[<a href=ridescontrol_admin.jsp?action=list>���̱ⱸ �������</a>]
<form name=form1 method=post action=ridescontrol_admin.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">���̱ⱸ �̸�</td>	
    <td ><input type="text" name="r_name" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">�׸���ũ ��ġ</td>
    <td ><input type="text" name="r_place" size="40"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">��������</td>
    <td ><input type="text" name="r_offseason" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">����</td>
    <td><input type="text" name="r_price" size="40"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="���"><input type=reset value="���"></td>
</tr>
</table>
</form>
</center>
</body>
</html>