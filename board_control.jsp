<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  errorPage="board_error.jsp" import="jspbook.solProject.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("euc-kr"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bb" class="jspbook.solProject.BoardBean"/>
<jsp:useBean id="board" class="jspbook.solProject.Board"/>
<jsp:setProperty name="board" property="*"/>
<% 
	// ����� ��û�� �����ϱ� ���� �Ķ���͸� ������ ����
	String action = request.getParameter("action");
	
	// �Խù� ��� ��û�� ���
	if(action.equals("list")) {
		response.sendRedirect("board_list.jsp");
	}
	// �Խù� ��� ��û�� ���
	else if(action.equals("insert")) {		
		if(bb.insertDB(board)) {
			response.sendRedirect("board_list.jsp");
		}
		else
			throw new Exception("DB �Է¿���");
	}
	// �Խù� ����ȭ�� ��û�� ���
	else if(action.equals("edit")) {
		Board board1 = bb.getDB(board.getB_id());
		if(!board.getB_passwd().equals(board1.getB_passwd())) {
			out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.!!');history.go(-1);</script>");
		}
		else {
			request.setAttribute("board",board1);
			pageContext.forward("board_edit_form.jsp");
		}
	}
	// �Խù� ���� ó���� ���
	else if(action.equals("update")) {
			if(bb.updateDB(board)) {
				response.sendRedirect("board_list.jsp");
			}
			else
				throw new Exception("DB ���ſ���");
	}
	// �Խù� ��ü ��û�� ���
	else if(action.equals("delete")) {
		if(bb.deleteDB(board.getB_id())) {
			response.sendRedirect("board_list.jsp");
		}
		else
			throw new Exception("DB ���� ����");
	}
	else if(action.equals("reply")) {
		int num = Integer.parseInt(request.getParameter("reply_num")); 
			if(bb.replyDB(board, num)) {
				response.sendRedirect("board_list.jsp");
			}
			else
				throw new Exception("DB �亯���� ");
	}

	else {
		out.println("<script>alert('action �Ķ���͸� Ȯ���� �ּ���!!!')</script>");
	}
%>

</body>
</html>