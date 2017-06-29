<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="board_error.jsp" import="java.util.*, jspbook.solProject.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language=JavaScript>
	function check(b_id) {
		pwd = prompt('수정/삭제 하려면 비밀번호를 넣으세요');
		document.location.href="board_control.jsp?action=edit&b_id="+b_id+"&b_passwd="+pwd;
	}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판:목록화면</title>
</head>

<%
	BoardBean bb = new BoardBean();
	ArrayList<Board> datas = bb.getDBList();
%>
<body>
<center>
<H2>게시판:목록화면 </H2>
<HR>
<form>
<a href="board_form.jsp">게시판 쓰기</a><P>

		<table cellpadding=5 cellspacing=0 border="1">
			<tr  bgcolor="#99CCFF" ><td>번호</td><td>작성자</td><td>제목</td><td>작성일</td><td>내용</td></tr>
			<%
				// ArrayList 객체를 통해 DB에서 가져온 목록을 출력함.
				for(Board board : datas) {
			%>
			  <tr>
			   <td><%=board.getB_id() %></td>
				<td><%=board.getB_name() %></td>
				<td><%=board.getB_title() %></td>
				<td><%=board.getB_date() %></td>
				<td><a href=javascript:check('<%=board.getB_id() %>')><%=board.getB_contents() %></a></td>
			  </tr>
			 <%
				}
			 %>
		</table>
</form>


<form  method=post  action=board_reply.jsp>
	<table border="1" align="center" cellspacing="0" cellpadding="5">
     
  <tr> 
      <td>답변 할 게시물 번호</td>
      <td><input type="text" name="reply_num" size=10></td>
       <td> <input type=submit value=" 답변화면가기"> </td>
  </tr>
 
	</table>
</form>
<a href="main.jsp">메인 메뉴 가기</a><P>
<HR>
</center>
</body>
</html>