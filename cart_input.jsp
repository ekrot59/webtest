<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="cart_error.jsp"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ٱ��Ͽ� ���</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="reservation" class="jspbook.solProject.Reservation" scope="session" />
<jsp:useBean id="resb" class="jspbook.solProject.ReservationBean" scope="session" />
<jsp:setProperty name="reservation" property="*"/>
<%
	java.util.Calendar cal = java.util.Calendar.getInstance();

	String a_id = login.getA_id();
	String strResid = session.getId().substring(0,3) + (cal.get(cal.SECOND)+1)*cal.get(cal.MINUTE)*cal.get(cal.DATE); //strResid�� �ִ��� ��ġ�� �ʵ��� �����ϰ� ����� ���� �̷��� ����.
	
	//strCartid�� cart_id�� cart�� �ִ´�.
	reservation.setA_id(a_id);
	reservation.setRes_id(strResid);
	int count = Integer.parseInt(request.getParameter("count"));
	reservation.setCount(count);
	int r_id = Integer.parseInt(request.getParameter("r_id"));
	reservation.setR_id(r_id);
	
	//cart�� ��ǰ�� ����ִ��� Ȯ��.
	//īƮ�� ��ǰ�� ����.
	if(!resb.checkDB(a_id, r_id)){
		%>
		<script language=JavaScript>
				document.location.href="cartcontrol.jsp?action=insert";
		</script>
		<%
	} 
	else {	//īƮ�� �̹� ��ǰ�� �ִ�.
		%>	
		<script>
		alert("�̹� ��ǰ�� ���� �Ǿ� �ֽ��ϴ�.");
		history.go(-1);
		</script>
		<%
	}
			
		%>
<body>
</body>
</html>