
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>

<%-- session ������ LoginBean�� ����� �Ѵ�. --%>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<body>
<hr>
<%
	if(!login.checkUser()) {
%>
<script>
	alert("�α��� ����!! �ٽ� �α��� �� �ּ���.");
	history.go(-1);
</script>
<%
	}
	else {
		session.setAttribute("username",request.getParameter("a_id"));

		response.sendRedirect("main.jsp");
	}
%>

</body>
</html>