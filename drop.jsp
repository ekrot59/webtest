<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ż��</title>
</head>

<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean"/>
<body>

<%
	if(!ab.deleteDB(login.getA_id())) {
%>
<script>
	alert("����! �ٽ� �õ��� �ּ���.");
	history.go(-1);
</script>
<%
	}
%>
<center>
���������� Ż�� �Ǿ����ϴ�.
<hr>
[<a href="login_form.html">�α��� ������</a>]
</center>
</body>
</html>