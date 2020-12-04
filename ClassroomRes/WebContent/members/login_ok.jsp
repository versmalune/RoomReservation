<%@page import="classroomManagement.members.model.MemberDAO"%>
<%@page import="classroomManagement.members.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = MemberDAO.getInstance();
	int chkNum = dao.userCheck(id, pw);
	
	if (chkNum == MemberDAO.LOGIN_FAIL_ID) {
%>
	<script>
		alert("ID DOESN'T EXIST.");
		history.go(-1);
	</script>
<%
	} else if (chkNum == MemberDAO.LOGIN_FAIL_PW) {
%>
	<script>
		alert("WRONG PASSWORD.");
		history.go(-1);
	</script>
<%
	} else {

		//1. dao를 통해 지금 로그인한 회원의 정보를 받아옴.
		//2. 해당 정보에서 id와 name을 받은 후 
		//3. id와 name을 세션에 저장.
		MemberVO vo = dao.getMember(id);
		
		String name = vo.getName();
		String stdId = vo.getStdId();
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("stdId", stdId);
		
		response.sendRedirect("/decadance");
	}
%>



















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
	
	
	
	
	
	
	
	
	
	<jsp:include page="../include/footer.jsp"/>
	

</body>
</html>