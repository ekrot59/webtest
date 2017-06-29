<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	// 삭제 확인을 위한 자바스크립트
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 탈퇴</title>
</head>
<jsp:useBean id="login" class="jspbook.solProject.LoginBean" scope="session" />
<jsp:useBean id="audience" class="jspbook.solProject.Audience"/>
<jsp:useBean id="ab" class="jspbook.solProject.AudienceBean"/>
<%
	if(login.getA_id().equals("admin")){
%>
<script>
	alert("관리자는 DB를 통해 계정을 변경해 주세요.");
	history.go(-1);
</script>
<%
	}
%>
<%
	audience = ab.getAudience(login.getA_id());
%>
<body>
<center>
<h2>회원 탈퇴</h2>
<%=login.getA_id() %>님의 회원정보
<hr>

<form name=form1 method=post action=drop.jsp>
<table cellpadding=5 cellspacing=0 border="1" align="center">
  <tr>
    <td bgcolor="#99CCFF">아이디</td>
    <td width='150'>
         <%=audience.getA_id() %>
    </td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">이름</td>
    <td width='150'><%=audience.getA_name() %></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">비밀번호</td>
    <td width='150'><%=audience.getA_passwd() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">전화번호 </td>
    <td width='150'><%=audience.getA_tel() %></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">e-mail</td>
    <td width='150'><%=audience.getA_email() %></td>
  </tr>
  <tr>
  	<td colspan=2 align=center>
  		<input type="submit" value="회원탈퇴">
	</td>
  </tr>
</table>
[<a href="main.jsp">main</a>]
</form>


</center>
</body>
</html>