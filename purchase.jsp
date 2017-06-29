<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>구매 완료</title>
</head>
<body>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<center>
<%
	PurchaseBean pb = new PurchaseBean();
	ArrayList<Purchase> datas = pb.getDBListPurchase();
%>
<h2>구매 완료</h2>
<hr>
<%=login.getA_id() %>님, 구매가 완료되었습니다.
<br>감사합니다 :)
<br><br>
[<a href="main.jsp">메인 화면으로</a>]
[<a href="rideslist_user.jsp">놀이기구 목록으로</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='50'>주문 코드 번호</TD>
		<TD align='center' width='250'>놀이기구 이름</TD>
		<TD align='center' width='100'>주문 ID</TD>
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