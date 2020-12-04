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
		<h3 style = "color:silver">LOGIN</h3><hr><br>
	
		<form action = "login_ok.jsp" method = "post">
			<table border = "1" cellpadding = "1" cellspacing = "1">
				<tr>
					<td>
						<input type = "text" name = "id" size = "10" placeholder = "ID">
					</td>
				</tr>
			
				<tr>
					<td>
						<input type = "password" name = "pw" size = "10" placeholder = "PW">
					</td>
				</tr>
				
			</table>
			<br>
			<input type = "submit" class = "btn btn-default" value = "LOGIN">&nbsp;&nbsp;
			<input type = "button" class = "btn btn-default" value = "JOIN" onclick = "javascript:window.location='join_form.jsp'" >
			
		
		</form>
	
	</div>
			
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>