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
	
	//장바구니에 추가
	if(action.equals("insert")){
		if(resb.insertDB(reservation)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB 입력오류");
	}
	//수정/삭제를 위해 선택한 물품 정보 불러오기
	else if(action.equals("edit")){
		request.setAttribute("ride", ride);
		pageContext.forward("cart_edit.jsp");
	}
	//수정
	else if(action.equals("update")){
		if(resb.updateDB(reservation, ride)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB 갱신오류");
	}
	//물품 삭제
	else if(action.equals("delete")) {
		if(resb.deleteDBP(reservation, ride)) {
			pageContext.forward("cart_list.jsp");
		}
		else
			throw new Exception("DB 삭제오류");
	}
	//주문취소
	else if(action.equals("remove")) {
		if(pb.deleteDB(purchase.getCodenum())) {
			pageContext.forward("purchaselist_user.jsp");
		}
		else
			throw new Exception("DB 삭제오류");
	}
	
	//구매 
	else if(action.equals("order")){
		String a_id = login.getA_id();
		//구매 리스트 가져오기.
		ArrayList order_list = (ArrayList)session.getAttribute("order_list");
		
			audience = ab.getAudience(a_id);
			//order_user에 회원 정보 입력, 구매 리스트 저장
			if(pub.insertToPurchaseUser(audience,order_list)){
								
					//카트 삭제
					if(resb.deleteDB(reservation)) {
						pageContext.forward("purchase.jsp");
					}
					else
						throw new Exception("DB 삭제오류");
				}
				else
					throw new Exception("DB 입력오류");
			}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}		

%>
</body>
</html>