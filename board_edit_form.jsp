<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="board_error.jsp" import="jspbook.solProject.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<title>����:����ȭ��</title>
</head>

<%
	Board board = (Board)request.getAttribute("board");
%>

<body>
<center>
<H2>�Խ���:����ȭ�� </H2>
<HR>
[<a href=board_control.jsp?action=list>�Խù� �������</a>]
<form name=form1 method=post action=board_control.jsp>
<input type=hidden name="b_id" value="<%=board.getB_id()%>">
<input type=hidden name="action" value="update">

<table cellpadding=5 cellspacing=0 border="1">
	<tr>
    <td bgcolor="#99CCFF">�� �� ��</td>	
    <td><input type="text" name="b_name" value="<%=board.getB_name() %>" size="20"></td>
  </tr>
   <tr>
    <td bgcolor="#99CCFF">��й�ȣ</td>
    <td><input type="password" name="b_passwd" value="<%=board.getB_passwd() %>" size="20"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">����</td>
    <td><input type="text" name="b_title" value="<%=board.getB_title() %>" size="20"></td>
  </tr>
  
   <tr>
    <td bgcolor="#99CCFF">�̸���</td>
    <td><input type="text" name="b_email" value="<%=board.getB_email() %>" size="20"></td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="5" cols="40" name="b_contents" ><%=board.getB_contents()%></textarea></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="����"><input type=reset value="���"><input type="button" value="����" onClick="delcheck()"></td>
</tr>
</table>
</form>

</center>
</body>
</html>