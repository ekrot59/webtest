
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ȭ��</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<body>
<center>
<h2>ȸ�� ȭ��</h2>
<%=login.getA_id() %>�� �ȳ��ϼ��� :)
<hr>
[<a href="rideslist_admin.jsp">���̱ⱸ ����</a>]
[<a href="rideslist_user.jsp">���̱ⱸ ����</a>]
[<a href="board_list.jsp">�Խ���</a>]
[<a href="purchaselist_user.jsp">�ֹ� ����</a>]
[<a href="drop_user.jsp">ȸ�� Ż��</a>]
[<a href="login_form.html">�ٽ� �α���</a>]
</center>
</body>
</html>