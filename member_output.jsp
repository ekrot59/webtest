<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean"/>
<jsp:useBean id="audience" class="jspbook.solProject.Audience"/>
<jsp:setProperty name="audience" property="*"/>
<%
	if(request.getParameter("a_id") != "" && request.getParameter("a_passwd") !=""){
		if(ab.checkID(request.getParameter("a_id"))){
			if(ab.insertDB(audience)){
				response.sendRedirect("login_form.html");
			}
			else
				throw new Exception("DB �Է� ����");
		}
		else {
%>
<script>
	alert("�ߺ��� ID�� �ֽ��ϴ�!!");
	history.go(-1);
</script>
<% 	
		}
	}
	else {
%>
<script>
	alert("ID �Ǵ� PASSWORD�� �Է��� �ּ���!!");
	history.go(-1);
</script>
<%
	}
%>
</body>
</html>