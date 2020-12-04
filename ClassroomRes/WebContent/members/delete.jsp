<%@page import="classroomManagement.members.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String check = request.getParameter("confirm");
	
	if (check == null){
		response.sendRedirect("delete_checkPw.jsp");
	}
	

	String id = (String)session.getAttribute("id"); //VO에서 (DB) 얻는 것보다 세션에서 얻는 게 더 빠르니까 이렇게 함
	String name = (String)session.getAttribute("name");
	String pw = request.getParameter("check_pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	int n = dao.userCheck(id, pw);

%>    

<!DOCTYPE html>
<html>
<head>

<style>
.div_center {
    margin-bottom: 20px;
    padding: 30px 15px;
    background: #fff;
    background: rgba(255,255,255,0.9);
}      
</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>DECADANCE</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    
    <script src = "../js/member.js"></script>

</head>

<body>

    <!-- Navigation -->
	<jsp:include page="../include/header.jsp"/>
	
		<div class = "div_center" align = "center">
		
		<% if (n == 1) { %>
			<h4><%= name %>(<%= id %>)님, 정말로 회원 정보를 삭제하시겠습니까?</h4>
			<a href = "/decadance/members/delete_ok.jsp">YES</a>&nbsp;&nbsp;
			<a href = "/decadance/members/mypage.jsp">NO</a>
		<%} else {%>
			<script>
				alert("ENTER PASSWORD AGAIN");
				history.go(-1);
			</script>
			<% } %>
		</div>
		
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>