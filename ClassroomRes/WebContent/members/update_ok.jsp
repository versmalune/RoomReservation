<%@page import="classroomManagement.members.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("email");
	String address = request.getParameter("address");
	String id = (String) session.getAttribute("id");
	
	MemberDAO dao = MemberDAO.getInstance();
	int n = dao.updateMember(email, address, id);
	
	if(n==1) {
%>
	<script>
		alert("회원정보가 정상적으로 수정되었습니다.");
		document.location.href="/decadance";
	</script>
<%
	}else {
%>	
	<script>
		alert("회원정보 수정이 실패했습니다.");
		history.go(-1);
	</script>
<%
	}
%>	



