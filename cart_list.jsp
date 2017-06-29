<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="cart_error.jsp"
    pageEncoding="EUC-KR"  import="java.util.*, jspbook.solProject.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ٱ��� ����Ʈ</title>
<script language=JavaScript>
	function check(r_id) {
		document.location.href="cartcontrol.jsp?action=edit&r_id="+r_id;
	}
	function order(){
		document.location.href="cartcontrol.jsp?action=order";
	}
</script>
</head>
<body>

<jsp:useBean id="reservation" class="jspbook.solProject.Reservation" scope="session" />
<jsp:useBean id="resb" class="jspbook.solProject.ReservationBean" scope="session" />
<jsp:setProperty name="reservation" property="*"/>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />

<center>

<%
	ArrayList<Reservation> datas = resb.getDBListRes(reservation.getA_id());
%>

<h2>�� ��ٱ���</h2>
<hr>
[<a href="rideslist_user.jsp">���̱ⱸ �������(��ٱ��� �߰�  ���)</a>]
<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='100'>���̱ⱸ ��ȣ</TD>
		<TD align='center' width='250'>���̱ⱸ �̸�</TD>
		<TD align='center' width='100'>����</TD>
		<TD align='center' width='100'>Ƚ��</TD>
		<TD align='center' width='100'>����/����</TD>
	</TR>
<%
	//�ݾ� �հ�
	int sum = 0;
	//��ٱ����� ��ǰ ����Ʈ�� ���� ArrayList --> ���Žÿ� order_ok�� ��ǰ�� ���� �� �ʿ�
	ArrayList item = new ArrayList();
	//��ٱ��� ����Ʈ ��������
	//String sql = "select C.code, G.title, G.price, C.amount from Cart C, Goods G where C.cart_id = '" + cart.getCart_id() + "'  and C.code = G.code";
	
	
	// ArrayList ��ü�� ���� DB���� ������ ����� �����.
	for(Reservation res : datas) {
		int r_id = res.getR_id();
		String r_name = res.getR_name();
		int r_price = res.getR_price();
		int count = res.getCount();
		sum += r_price*count; //�� �ݾ�
		item.add(r_name);
%>
	<tr>
		<td><%=r_id%></td>
		<td><%=r_name %></td>
		<td><%= r_price %></td>
		<td><%= count %></td>
		<td><a href="javascript:check('<%=r_id %>')">����/����</a></td>
	</tr>
<%
	}
%>
	
<% 
	//��ǰ ����Ʈ�� ���� ������ ����
	session.setAttribute("order_list", item);
%>
</TABLE>
<br>
#�Ѿ� : <%= sum %>
<br><br>
<a href="javascript:order()">���� �����ϱ�</a>
</center>
</body>
</html>