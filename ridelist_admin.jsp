<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, jspbook.solProject.*" errorPage="rides_error.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language=JavaScript>
	// 삭제 확인을 위한 자바스크립트
	function delcheck() {
		// 메시지 창을 통해 YES/NO 확인
		result = confirm("정말로 삭제하시겠습니까 ?");
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>놀이기구  수정, 삭제</title>
</head>
<%	
	Ride ride = (Ride)request.getAttribute("ride"); 
%>
<body>
<center>
<h2>놀이기구 수정,삭제</h2>
<hr>
[<a href=ridescontrol_admin.jsp?action=list>상품목록으로</a>]
<form name=form1 method=post action=ridescontrol_admin.jsp>
<input type=hidden name="r_id" value="<%=ride.getR_id()%>">
<input type=hidden name="action" value="update">
<table cellpadding=5 cellspacing=0 border="1">
  <tr>
    <td bgcolor="#99CCFF">놀이기구 이름</td>	
    <td ><input type="text" name="r_name" size="40"  value="<%=ride.getR_name()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">테마파크 위치</td>
    <td ><input type="text" name="r_place" size="40" value="<%=ride.getR_place()%>"></td>
  </tr>
    <tr>
    <td bgcolor="#99CCFF">오프시즌</td>
    <td ><input type="text" name="r_offseason" size="40" value="<%=ride.getR_offseason()%>"></td>
  </tr>
  <tr>
    <td bgcolor="#99CCFF">가격</td>
    <td><input type="text" name="r_price" size="40" value="<%=ride.getR_price() %>"></td>
  </tr>
  <tr>
    <td colspan=2 align=center><input type=submit value="저장"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>
</center>
</body>
</html>