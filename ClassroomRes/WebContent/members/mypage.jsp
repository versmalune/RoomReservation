<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   if(session.getAttribute("id") == null) {
      response.sendRedirect("/decadance");
   }
   String id = (String)session.getAttribute("id");
   String name = (String)session.getAttribute("name");

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
   

    <title>MY CLASSROOM!</title>

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
  
	
	<h3>MY PAGE</h3>
	<hr>
	
	<p>
		<%= name %>(<%=id %>)님의 정보를 관리합니다.
	</p>
	
	<a href="/decadance/members/change_pw.jsp">[비밀번호 변경]</a>&nbsp;&nbsp;
	<a href="/decadance/members/update_form.jsp">[회원 정보 변경]</a>&nbsp;&nbsp;
	<a href="/decadance/members/delete_checkPw.jsp">[회원 탈퇴]</a>
	</div>
	
<jsp:include page="../include/footer.jsp" />
</body>
</html>
