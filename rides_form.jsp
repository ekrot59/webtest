<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  errorPage="rides_error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>놀이기구 등록 화면</title>
</head>
<body>
<center>
<h2>놀이기구 등록</h2>
<hr>
[<a href=ridescontrol_admin.jsp?action=list>놀이기구 목록으로</a>]
<form name=form1 method=post action=ridescontrol_admin.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">놀이기구 이름</td>	
    <td ><input type="text" name="r_name" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">테마파크 위치</td>
    <td ><input type="text" name="r_place" size="40"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">오프시즌</td>
    <td ><input type="text" name="r_offseason" size="40"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">가격</td>
    <td><input type="text" name="r_price" size="40"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="등록"><input type=reset value="취소"></td>
</tr>
</table>
</form>
</center>
</body>
</html>