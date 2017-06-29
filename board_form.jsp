<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="board_error.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판:작성화면</title>
</head>
<body>
<center>
<H2>게시판:작성화면 </H2>
<HR>
[<a href=board_control.jsp?action=list>게시물목록으로</a>]
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="action" value="insert">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">작 성 자</td>	
    <td><input type="text" name="b_name" size="20"></td>
  </tr>
   <tr>
    <td bgcolor="#99CCFF">비밀번호</td>
    <td><input type="password" name="b_passwd" size="20"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">제목</td>
    <td><input type="text" name="b_title" size="20"></td>
  </tr>
  
   <tr>
    <td bgcolor="#99CCFF">이메일</td>
    <td><input type="text" name="b_email" size="20"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" name="b_contents" cols="40"></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"></td>
</tr>
</table>
</form>

</center>
</body>
</html>