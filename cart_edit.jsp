<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*" errorPage="cart_error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ǰ ����/����</title>
<script language=JavaScript>
	// ���� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		result = confirm("������ �����Ͻðڽ��ϱ� ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
</head>
<body>
<jsp:useBean id="ride" class="jspbook.solProject.Ride"/>
<jsp:useBean id="rb" class="jspbook.solProject.RideBean"/>
<jsp:setProperty name="ride" property="*"/>
<%
	Ride ride1 = rb.getDB(ride.getR_id());
%>
<center>
<h2>��ǰ ����/����</h2>
<hr>
[<a href="cart_list.jsp">�� ��ٱ���</a>]
<form name=form1 method="post" action="cartcontrol.jsp">
<input type=hidden name="action" value="update"/>
<input type=hidden name="r_id" value="<%=ride.getR_id() %>"/>
<table cellpadding=5 cellspacing=0 border="1">
	<tr  bgcolor="#99CCFF" ><td>���̱ⱸ ��ȣ</td><td>���̱ⱸ �̸�</td><td>�׸���ũ ��ġ</td><td>��������</td><td>����</td><td>���� ����</td></tr>
	<tr>
		<td><%=ride1.getR_id()%></td>
		<td><%=ride1.getR_name() %></td>
		<td><%=ride1.getR_place() %></td>
		<td><%=ride1.getR_offseason() %></td>
		<td><%=ride1.getR_price() %></td>
		<td>
		<select name=count>
			<option selected>1</option>
			<option>2</option>
			<option>3</option>
			<option>4</option>
			<option>5</option>
			<option>6</option>
			<option>7</option>
			<option>8</option>
			<option>9</option>
			<option>10</option>
		</select>
		</td>
	</tr>
</table>
<br>
<input type="submit" value="����"/>
<input type="button" value="����" onClick="delcheck()">
</form>
</center>
</body>
</html>