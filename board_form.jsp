<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="board_error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���:�ۼ�ȭ��</title>
</head>
<body>
<center>
<H2>�Խ���:�ۼ�ȭ�� </H2>
<HR>
[<a href=board_control.jsp?action=list>�Խù��������</a>]
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">�� �� ��</td>	
    <td><input type="text" name="b_name" size="20"></td>
  </tr>
   <tr>
    <td bgcolor="#99CCFF">��й�ȣ</td>
    <td><input type="password" name="b_passwd" size="20"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">����</td>
    <td><input type="text" name="b_title" size="20"></td>
  </tr>
  
   <tr>
    <td bgcolor="#99CCFF">�̸���</td>
    <td><input type="text" name="b_email" size="20"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" name="b_contents" cols="40"></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"></td>
</tr>
</table>
</form>

</center>
</body>
</html>