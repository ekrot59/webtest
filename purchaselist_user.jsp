<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	function check(codenum) {
		result = confirm("������ �ֹ��� ��� �Ͻðڽ��ϱ� ?");
		if(result == true){
			document.location.href="cartcontrol.jsp?action=remove&codenum="+codenum;
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ� Ȯ��</title>
</head>
<body>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="Resb" class="jspbook.solProject.ReservationBean" scope="session" />
<center>
<% 
	PurchaseBean pb = new PurchaseBean();
	String a_id=login.getA_id();
	ArrayList<Purchase> datas = pb.getDBListPurchaseAll(a_id);
	
%>
<h2>�ֹ� ����Ʈ</h2>
<hr>
<% 
if(!login.getA_id().equals("admin")){
%>	<%=login.getA_id() %>���� �ֹ� ����Ʈ
<%
} else{%>
	��ü���� �ֹ� ����Ʈ
<%} %>
<br><br>
[<a href="main.jsp">���� ȭ������</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='50'>�ֹ� �ڵ� ��ȣ</TD>
		<TD align='center' width='250'>���̱ⱸ �̸�</TD>
		<TD align='center' width='100'>��ǥ �ֹ� ��ȣ </TD>
	</TR>
<%
	//��ٱ��� ����Ʈ ��������
		for(Purchase purchase : datas) {
			int p_id = purchase.getP_id();
			String r_name = purchase.getR_name();
	        int codenum = purchase.getCodenum();
%>
	<tr>
		<td><a href="javascript:check('<%=purchase.getCodenum()%>')"><%=codenum%></a></td>
		<td><%=r_name %></td>
		<td><%=p_id %></td>
	</tr>
<%
		}
		if(login.getA_id().equals("admin")){
			ArrayList<Purchase> datas2 = pb.getDBList();
			for(Purchase purchase : datas2) {
				int p_id = purchase.getP_id();
				String r_name = purchase.getR_name();
		        int codenum = purchase.getCodenum();
%>
		<tr>
			<td><%=codenum %></td>
			<td><%=r_name %></td>
			<td><%=p_id %></td>
		</tr>
<%
			}
			
		}
%>

</TABLE>
</center>
</body>
</html>