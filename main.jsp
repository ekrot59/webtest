
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 화면</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<body>
<center>
<h2>회원 화면</h2>
<%=login.getA_id() %>님 안녕하세요 :)
<hr>
[<a href="rideslist_admin.jsp">놀이기구 관리</a>]
[<a href="rideslist_user.jsp">놀이기구 구매</a>]
[<a href="board_list.jsp">게시판</a>]
[<a href="purchaselist_user.jsp">주문 정보</a>]
[<a href="drop_user.jsp">회원 탈퇴</a>]
[<a href="login_form.html">다시 로그인</a>]
</center>
</body>
</html>