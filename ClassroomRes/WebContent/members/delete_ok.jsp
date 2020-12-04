<%@page import="classroomManagement.members.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	1. DAO 연동
	2. 연동 결과에 따라 성공 시 세션 삭제, 알림 창으로 삭제 완료 알림
	3. 삭제 실패 시 알림 창으로 실패 알림, 마이페이지로 리다이렉팅 */

	String id = (String)session.getAttribute("id");
	
	MemberDAO dao = MemberDAO.getInstance();
	int n = dao.deleteMember(id);

	if (n == 1) {
		session.invalidate();
%>
		<script>
			alert("ACCOUNT SUCCESSFULLY DELETED.");
			document.location.href = "/decadance";
		</script>
<%
	} else {
%>

		<script>
			alert("ACCOUNT DELETE FAILED.")
			document.location.href = "/decadance/members/mypage.jsp";
		</script>
<%
	}
%>
