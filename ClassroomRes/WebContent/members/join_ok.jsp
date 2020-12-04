<%@ page import = "classroomManagement.members.model.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id = "vo" class = "classroomManagement.members.model.MemberVO" />    
<jsp:setProperty name = "vo" property = "*" />
    
<!DOCTYPE html>
<html>
<head>
<%
	MemberDAO dao = MemberDAO.getInstance();
	
	if(dao.confirmId(vo.getId()) == MemberDAO.MEMBER_EXISTENT){
%>
	<script>
		alert("EXISTING MEMBER");
		history.back();
	</script>	
<%
	} else {

	int num = dao.insertMember(vo);
	
	if(num == MemberDAO.JOIN_SUCCESS){
		
%>
	<script>
		alert("WELCOME");
		document.location.href="/decadance";
	</script>
<%
		} else {
%>
		<script>
			alert("FAILED");
			document.location.href="/decadance";
		</script>
<%
		}
	}
%>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>