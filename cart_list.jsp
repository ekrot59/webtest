<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="cart_error.jsp"
    pageEncoding="EUC-KR"  import="java.util.*, jspbook.solProject.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니 리스트</title>
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

<h2>내 장바구니</h2>
<hr>
[<a href="rideslist_user.jsp">놀이기구 목록으로(장바구니 추가  담기)</a>]
<br><br>
<TABLE border='1' cellspacing=1 cellpadding=2 width='600'> 
	<TR bgcolor='cccccc'>
		<TD align='center' width='100'>놀이기구 번호</TD>
		<TD align='center' width='250'>놀이기구 이름</TD>
		<TD align='center' width='100'>가격</TD>
		<TD align='center' width='100'>횟수</TD>
		<TD align='center' width='100'>수정/삭제</TD>
	</TR>
<%
	//금액 합계
	int sum = 0;
	//장바구니의 물품 리스트를 담을 ArrayList --> 구매시에 order_ok에 물품을 담을 때 필요
	ArrayList item = new ArrayList();
	//장바구니 리스트 가져오기
	//String sql = "select C.code, G.title, G.price, C.amount from Cart C, Goods G where C.cart_id = '" + cart.getCart_id() + "'  and C.code = G.code";
	
	
	// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
	for(Reservation res : datas) {
		int r_id = res.getR_id();
		String r_name = res.getR_name();
		int r_price = res.getR_price();
		int count = res.getCount();
		sum += r_price*count; //총 금액
		item.add(r_name);
%>
	<tr>
		<td><%=r_id%></td>
		<td><%=r_name %></td>
		<td><%= r_price %></td>
		<td><%= count %></td>
		<td><a href="javascript:check('<%=r_id %>')">수정/삭제</a></td>
	</tr>
<%
	}
%>
	
<% 
	//물품 리스트를 세션 변수로 설정
	session.setAttribute("order_list", item);
%>
</TABLE>
<br>
#총액 : <%= sum %>
<br><br>
<a href="javascript:order()">최종 구매하기</a>
</center>
</body>
</html>