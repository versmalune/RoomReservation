<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<form action = "join_ok.jsp" method = "post" name = "reg_form">
				<h3>JOIN</h3><hr>
				<table border = "1" cellpadding = "1" cellspacing = "1">
					<tr>
						<td align = "center">학번</td>
						<td align = "center"><input type = "text" name = "stdId"></td>
					</tr>
					<tr>
						<td align = "center">ID</td>
						<td align = "center"><input type = "text" name = "id"></td>
					</tr>
					<tr>
						<td align = "center">PW</td>
						<td align = "center"><input type = "password" name = "pw"></td>
					</tr>
					<tr>
						<td align = "center">PW CHECK</td>
						<td align = "center"><input type = "password" name = "pw_check"></td>
					</tr>
					<tr>
						<td align = "center">NAME</td>
						<td align = "center"><input type = "text" name = "name"></td>
					</tr>
					<tr>
						<td align = "center">EMAIL</td>
						<td align = "center"><input type = "text" name = "email"></td>
					</tr>
					<tr>
						<td align = "center">PHONE</td>
						<td align = "center"><input type = "text" name = "phone"></td>
					</tr>
				</table>
				<br>
				<input type = "button" class = "btn btn-default" value = "JOIN" onclick = "infoConfirm()">
				<!-- onclick 속성에는 자바스크립트 함수만 넣을 수 있음. 위에서 type에 button을 넣었기 때문에 js > member.js의 infoConfirm()에 submit 기능 넣어 줌. -->
				&nbsp;&nbsp;
				<input type = "reset" class = "btn btn-default" value = "CANCEL" onclick = "javascript:location.href='/decadance'">
			</form>
		</div>
	
	<jsp:include page="../include/footer.jsp"/>

</body>

</html>