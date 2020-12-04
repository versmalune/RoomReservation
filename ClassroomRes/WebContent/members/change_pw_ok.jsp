<%@page import="classroomManagement.members.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
   1. 폼데이터를 처리합니다.(예전비번, 바꿀비번)
   2. dao객체를 생성하여 조건문으로 조건식에 예전비번과 아이디정보를 바탕으로
      해당 비번이 일치하는지부터 확인.
   3. 일치한다면 비밀번호를 바꾸는 로직을 실행.
   4. 예전비번이 일치하지 않는다면 다시 전페이지로 리다이렉팅함.
--%>
<%
   String prevPw = request.getParameter("prev_pw");
   String afterPw = request.getParameter("after_pw");
   String id = (String)session.getAttribute("id");
   
   MemberDAO dao = MemberDAO.getInstance();
   
	if(dao.userCheck(id, prevPw) == 1) {
		int n = dao.changePassword(id, afterPw);
		if(n==1) {
%>
			<script>
			alert("PASSWORD SUCCESSFULLY UPDATED!");
			document.location.href="/decadance";
			</script>
<%
		} else {
%>      
	      <script>
	         alert("PASSWORD UPDATE FAILED!");
	         history.go(-1);
	      </script>
<%
		}
	} else {   
%>   
	   <script>
	      alert("현재 비밀번호가 다릅니다.");
	      history.go(-1);
	   </script>
<%
   }
%>