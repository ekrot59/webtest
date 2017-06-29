<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>탈퇴</title>
</head>

<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean"/>
<body>

<%
	if(!ab.deleteDB(login.getA_id())) {
%>
<script>
	alert("실패! 다시 시도해 주세요.");
	history.go(-1);
</script>
<%
	}
%>
<center>
정상적으로 탈퇴 되었습니다.
<hr>
[<a href="login_form.html">로그인 페이지</a>]
</center>
</body>
</html>