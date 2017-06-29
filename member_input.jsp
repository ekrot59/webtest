<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
<H2>회원가입 </H2>
<HR>
</center>
<form name=form1 method=post action=member_output.jsp>
<table cellpadding=5 cellspacing=0 border="1" align="center">
  <tr>
    <td bgcolor="#99CCFF">아이디</td>
    <td>
           <input type="text" name="a_id" size="20">
    	   <input type="button" OnClick='Check_id()' value='ID 중복검사'>
    </td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">이름</td>
    <td><input type="text" name="a_name" size="20"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">비밀번호</td>
    <td><input type="text" name="a_passwd" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">전화번호 </td>
    <td><input type="text" name="a_tel" size="20"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">e-mail</td>
    <td><input type="text" name="a_email" size="30"></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" name="submit_join" value="회원가입">
		<input type="reset" name="reset" value="리셋">
	</td>
  </tr>
</table>
</form>
<center>
<a href="login_form.html">로그인 </a>
</center>
</body>
</html>