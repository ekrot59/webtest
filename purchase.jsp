<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� �Ϸ�</title>
</head>
<body>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<center>
<%
	PurchaseBean pb = new PurchaseBean();
	ArrayList<Purchase> datas = pb.getDBListPurchase();
%>
<h2>���� �Ϸ�</h2>
<hr>
<%=login.getA_id() %>��, ���Ű� �Ϸ�Ǿ����ϴ�.
<br>�����մϴ� :)
<br><br>
[<a href="main.jsp">���� ȭ������</a>]
[<a href="rideslist_user.jsp">���̱ⱸ �������</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='50'>�ֹ� �ڵ� ��ȣ</TD>
		<TD align='center' width='250'>���̱ⱸ �̸�</TD>
		<TD align='center' width='100'>�ֹ� ID</TD>
	</TR>

<%
	for(Purchase purchase : datas) {
%>
	<tr>
		<td><%=purchase.getCodenum() %></td>
		<td><%=purchase.getR_name() %></td>
		<td><%=purchase.getP_id()%></td>		
	</tr>
<%
	}
%>
</TABLE>
<br>
</center>
</body>
</html>