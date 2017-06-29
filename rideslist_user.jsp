<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*" errorPage="cart_error.jsp"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>놀이기구 목록</title>
<script language=JavaScript>
	function check(r_id) {
		document.location.href="ridelist_user.jsp?r_id="+r_id;
	}
</script>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<%
	if(login.getA_id().equals("admin")){
%>
<script>
	alert("관리자는 놀이기구를 구매할 수 없습니다.");
	history.go(-1);
</script>
<%
	}
%>
<body>
<%
	RideBean rb = new RideBean();
	ArrayList<Ride> datas = rb.getDBList();
%>
<center>
<h2>놀이기구 목록</h2>
<hr>
[<a href="main.jsp">메인 화면으로</a>]
<form>
<table cellpadding=5 cellspacing=0 border="1">
	<tr  bgcolor="#99CCFF" ><td>놀이기구 번호</td><td>놀이기구 이름</td><td>테마파크 위치</td><td>오프시즌</td><td>가격</td></tr>
<%
	// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
	for(Ride ride : datas) {
%>
	<tr>
		<td><%=ride.getR_id()%></td>
		<td><a href="javascript:check('<%=ride.getR_id()%>')"><%=ride.getR_name() %></a></td>
		<td><%=ride.getR_place() %></td>
		<td><%=ride.getR_offseason() %></td>
		<td><%=ride.getR_price() %></td>
	</tr>
<%
	}
%>
</table>
</form>
<br>

</center>
</body>
</html>