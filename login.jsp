
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>

<%-- session 단위로 LoginBean을 열어야 한다. --%>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:setProperty name="login" property="*" />
<body>
<hr>
<%
	if(!login.checkUser()) {
%>
<script>
	alert("로그인 실패!! 다시 로그인 해 주세요.");
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