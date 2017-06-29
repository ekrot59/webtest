<%@ page language="java" contentType="text/html; charset=EUC-KR" errorPage="cart_error.jsp"
    pageEncoding="EUC-KR"  import="jspbook.solProject.*, java.util.ArrayList"%>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="reservation" class="jspbook.solProject.Reservation" scope="session" />
<jsp:useBean id="resb" class="jspbook.solProject.ReservationBean" scope="session" />
<jsp:setProperty name="reservation" property="*"/>
<jsp:useBean id="ride" class="jspbook.solProject.Ride" scope="session"/>
<jsp:useBean id="rb" class="jspbook.solProject.RideBean" scope="session"/>
<jsp:setProperty name="ride" property="*"/>
<jsp:useBean id="purchase" class="jspbook.solProject.Purchase" scope="session"/>
<jsp:useBean id="pb" class="jspbook.solProject.PurchaseBean" scope="session"/>
<jsp:setProperty name="purchase" property="*"/>
<jsp:useBean id="Purchase_user" class="jspbook.solProject.Purchase_user" scope="session"/>
<jsp:useBean id="pub" class="jspbook.solProject.Purchase_userBean" scope="session"/>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean" scope="session"/>
<jsp:useBean id="audience" class="jspbook.solProject.Audience" scope="session"/>
<%
	String action = request.getParameter("action");
	
	//��ٱ��Ͽ� �߰�
	if(action.equals("insert")){
		if(resb.insertDB(reservation)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB �Է¿���");
	}
	//����/������ ���� ������ ��ǰ ���� �ҷ�����
	else if(action.equals("edit")){
		request.setAttribute("ride", ride);
		pageContext.forward("cart_edit.jsp");
	}
	//����
	else if(action.equals("update")){
		if(resb.updateDB(reservation, ride)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB ���ſ���");
	}
	//��ǰ ����
	else if(action.equals("delete")) {
		if(resb.deleteDBP(reservation, ride)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB ��������");
	}
	//�ֹ����
	else if(action.equals("remove")) {
		if(pb.deleteDB(purchase.getCodenum())) {
			pageContext.forward("purchaselist_user.jsp");
		}
		else
			throw new Exception("DB ��������");
	}
	
	//���� 
	else if(action.equals("order")){
		String a_id = login.getA_id();
		//���� ����Ʈ ��������.
		ArrayList order_list = (ArrayList)session.getAttribute("order_list");
		
			audience = ab.getAudience(a_id);
			//order_user�� ȸ�� ���� �Է�, ���� ����Ʈ ����
			if(pub.insertToPurchaseUser(audience,order_list)){
								
					//īƮ ����
					if(resb.deleteDB(reservation)) {
						pageContext.forward("purchase.jsp");
					}
					else
						throw new Exception("DB ��������");
				}
				else
					throw new Exception("DB �Է¿���");
			}
	else {
		out.println("<script>alert('action �Ķ���͸� Ȯ���� �ּ���!!!')</script>");
	}		

%>
</body>
</html>