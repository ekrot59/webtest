<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*" errorPage="rides_error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̱ⱸ  ����, ����</title>
</head>
<%	
	Ride ride = (Ride)request.getAttribute("ride"); 
%>
<body>
<center>
<h2>���̱ⱸ ����,����</h2>
<hr>
[<a href=ridescontrol_admin.jsp?action=list>��ǰ�������</a>]
<form name=form1 method=post action=ridescontrol_admin.jsp>
<input type=hidden name="r_id" value="<%=ride.getR_id()%>">
<input type=hidden name="action" value="update">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">���̱ⱸ �̸�</td>	
    <td ><input type="text" name="r_name" size="40"  value="<%=ride.getR_name()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">�׸���ũ ��ġ</td>
    <td ><input type="text" name="r_place" size="40" value="<%=ride.getR_place()%>"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">��������</td>
    <td ><input type="text" name="r_offseason" size="40" value="<%=ride.getR_offseason()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">����</td>
    <td><input type="text" name="r_price" size="40" value="<%=ride.getR_price() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"><input type="button" value="����" onClick="delcheck()"></td>
</tr>
</table>
</form>
</center>
</body>
</html>