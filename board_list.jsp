<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="board_error.jsp" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language=JavaScript>
	function check(b_id) {
		pwd = prompt('����/���� �Ϸ��� ��й�ȣ�� ��������');
		document.location.href="board_control.jsp?action=edit&b_id="+b_id+"&b_passwd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Խ���:���ȭ��</title>
</head>

<%
	BoardBean bb = new BoardBean();
	ArrayList<Board> datas = bb.getDBList();
%>
<body>
<center>
<H2>�Խ���:���ȭ�� </H2>
<HR>
<form>
<a href="board_form.jsp">�Խ��� ����</a><P>

		<table cellpadding=5 cellspacing=0 border="1">
			<tr  bgcolor="#99CCFF" ><td>��ȣ</td><td>�ۼ���</td><td>����</td><td>�ۼ���</td><td>����</td></tr>
			<%
				// ArrayList ��ü�� ���� DB���� ������ ����� �����.
				for(Board board : datas) {
			%>
			  <tr>
			   <td><%=board.getB_id() %></td>
				<td><%=board.getB_name() %></td>
				<td><%=board.getB_title() %></td>
				<td><%=board.getB_date() %></td>
				<td><a href=javascript:check('<%=board.getB_id() %>')><%=board.getB_contents() %></a></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>


<form  method=post  action=board_reply.jsp>
	<table border="1" align="center" cellspacing="0" cellpadding="5">
     
  <tr> 
      <td>�亯 �� �Խù� ��ȣ</td>
      <td><input type="text" name="reply_num" size=10></td>
       <td> <input type=submit value=" �亯ȭ�鰡��"> </td>
  </tr>
 
	</table>
</form>
<a href="main.jsp">���� �޴� ����</a><P>
<HR>
</center>
</body>
</html>