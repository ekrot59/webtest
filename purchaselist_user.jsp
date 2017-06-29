<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	function check(codenum) {
		result = confirm("정말로 주문을 취소 하시겠습니까 ?");
		if(result == true){
			document.location.href="cartcontrol.jsp?action=remove&codenum="+codenum;
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문 확인</title>
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
<h2>주문 리스트</h2>
<hr>
<% 
if(!login.getA_id().equals("admin")){
%>	<%=login.getA_id() %>님의 주문 리스트
<%
} else{%>
	전체고객의 주문 리스트
<%} %>
<br><br>
[<a href="main.jsp">메인 화면으로</a>]

<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='50'>주문 코드 번호</TD>
		<TD align='center' width='250'>놀이기구 이름</TD>
		<TD align='center' width='100'>대표 주문 번호 </TD>
	</TR>
<%
	//장바구니 리스트 가져오기
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