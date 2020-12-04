<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%if(session.getAttribute("id")==null) {%>
<script>
	alert("LOGIN NEEDED");
	document.location.href='/decadance';
</script>
<%} %>

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
   

    <title>My Classroom</title>

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
    
    <script src = "../js/reserve.js"></script>

</head>

<body>

    <!-- Navigation -->
	<jsp:include page="../include/header.jsp"/>
	<div class="div_center" align="center">
	
	<h3>Available Classrooms</h3>
	<hr>
	<form action = "write.board" method = "post" name = "reserve_form">
	<table align="center" width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td align="center">Classroom No</td>
			<td align="center">Available Time</td>
			<td align="center">Available Day</td>
			<td align="center">People</td>
			<td align="center">Projector</td>
			<td align="center">Electricity</td>
			<td align="center">TV</td>
			<td align="center">Computer</td>
			<td>SELECT</td>
		</tr>
		
		<c:forEach var="vo" items="${board_list}">
		<tr>
			<td align="center">${vo.classno}</td>
			<td align="center">${vo.day}</td>
			<td align="center">${vo.starttimeok} ~ ${vo.endtimeok}</td>
			<td align="center">${vo.people}</td>
			<td align="center">${vo.projector}</td>
			<td align="center">${vo.electricity}</td>
			<td align="center">${vo.tv}</td>
			<td align="center">${vo.computer}</td>
			<td align="center"> <input type = "radio" name = "resclass" value = ${vo.classno},${vo.starttimeok},${vo.endtimeok},${vo.day}> </td>
		</tr>
		</c:forEach>
		
		<tr>
			<td colspan="9" align="center">
				<input type = "button" class = "btn btn-default" value = "RESERVE" onclick = "reserve()">
			</td>
		</tr>
		
		<tr>
			<td align="center" colspan="9">
				<a href="find.board">[SEARCH AGAIN]</a>
			</td>
		</tr>

	</table>
	</form>
	</div>
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>