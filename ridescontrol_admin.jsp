<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  errorPage="rides_error.jsp" import="jspbook.solProject.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ride" class="jspbook.solProject.Ride"/>
<jsp:useBean id="rb" class="jspbook.solProject.RideBean"/>
<jsp:setProperty name="ride" property="*"/>
<% 
	// ����� ��û�� �����ϱ� ���� �Ķ���͸� ������ ����
	String action = request.getParameter("action");

	// ��ǰ ��� ��û�� ���
	if(action.equals("list")) {
		response.sendRedirect("rideslist_admin.jsp");
	}
	// ��ǰ ��� ��û�� ���
	else if(action.equals("insert")) {		
		if(rb.insertDB(ride)) {
			response.sendRedirect("rideslist_admin.jsp");
		}
		else
			throw new Exception("DB �Է¿���");
	}
	// ��ǰ ���� ��û�� ���
	else if(action.equals("edit")) {
		Ride ride1 = rb.getDB(ride.getR_id());
		request.setAttribute("ride",ride1);
		pageContext.forward("ridelist_admin.jsp");
	}
	// ��ǰ ���� ó���� ���
	else if(action.equals("update")) {
			if(rb.updateDB(ride)) {
				response.sendRedirect("rideslist_admin.jsp");
			}
			else
				throw new Exception("DB ���ſ���");
	}
	// ��ǰ ��ü ��û�� ���
	else if(action.equals("delete")) {
		if(rb.deleteDB(ride.getR_id())) {
			response.sendRedirect("rideslist_admin.jsp");
		}
		else
			throw new Exception("DB ���� ����");
	}
%>
</body>
</html>