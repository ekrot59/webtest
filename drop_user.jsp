<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	// ���� Ȯ���� ���� �ڹٽ�ũ��Ʈ
	function delcheck() {
		// �޽��� â�� ���� YES/NO Ȯ��
		result = confirm("������ �����Ͻðڽ��ϱ� ?");
		if(result == true){
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� Ż��</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="audience" class="jspbook.solProject.Audience"/>
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean"/>
<%
	if(login.getA_id().equals("admin")){
%>
<script>
	alert("�����ڴ� DB�� ���� ������ ������ �ּ���.");
	history.go(-1);
</script>
<%
	}
%>
<%
	audience = ab.getAudience(login.getA_id());
%>
<body>
<center>
<h2>ȸ�� Ż��</h2>
<%=login.getA_id() %>���� ȸ������
<hr>

<form name=form1 method=post action=drop.jsp>
<table cellpadding=5 cellspacing=0 border="1" align="center">
  <tr>
    <td bgcolor="#99CCFF">���̵�</td>
    <td width='150'>
         <%=audience.getA_id() %>
    </td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">�̸�</td>
    <td width='150'><%=audience.getA_name() %></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">��й�ȣ</td>
    <td width='150'><%=audience.getA_passwd() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">��ȭ��ȣ </td>
    <td width='150'><%=audience.getA_tel() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">e-mail</td>
    <td width='150'><%=audience.getA_email() %></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" value="ȸ��Ż��">
	</td>
  </tr>
</table>
[<a href="main.jsp">main</a>]
</form>


</center>
</body>
</html>