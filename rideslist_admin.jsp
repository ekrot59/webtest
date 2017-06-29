<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*" errorPage="rides_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	function check(r_id) {
		document.location.href="ridescontrol_admin.jsp?action=edit&r_id="+r_id;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̱ⱸ ��� ȭ��</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<%
	if(!login.getA_id().equals("admin")){
%>
<script>
	alert("�����ڰ� �ƴմϴ�!!");
	history.go(-1);
</script>
<%
	}
%>
<body>
<%
	RideBean rb = new RideBean();
	ArrayList<Ride> datas = rb.getDBList();
%>
<center>
<h2>���̱ⱸ ���</h2>
<hr>
[<a href="rides_form.jsp">���̱ⱸ ���</a>]
[<a href="main.jsp">���� ȭ������</a>]
<form>
<table cellpadding=5 cellspacing=0 border="1">
	<tr  bgcolor="#99CCFF" ><td>���̱ⱸ ��ȣ</td><td>���̱ⱸ �̸�</td><td>�׸���ũ ��ġ</td><td>��������</td><td>����</td></tr>
<%
	// ArrayList ��ü�� ���� DB���� ������ ����� �����.
	for(Ride ride : datas) {
%>
	<tr>
		<td><%=ride.getR_id()%></td>
		<td><a href="javascript:check('<%=ride.getR_id()%>')"><%=ride.getR_name() %></a></td>
		<td><%=ride.getR_place() %></td>
		<td><%=ride.getR_offseason() %></td>
		<td><%=ride.getR_price() %></td>
	</tr>
<%
	}
%>
</table>
<br>
</center>
</body>
</html>