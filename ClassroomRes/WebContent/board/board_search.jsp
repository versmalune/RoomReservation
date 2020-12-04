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
    
    <script src = "../js/search.js"></script>

</head>
<body>
    <!-- Navigation -->
	<jsp:include page="../include/header.jsp"/>

	<div class = "div_center" align = "center">
		<h3>SEARCH CLASSROOM</h3><hr>
		<div class="row">
	            <div class="box">
	                <div class="col-lg-12">
	                    <hr>
	                    <h2 class="intro-text text-center">HOW TO RESERVE A CLASSROOM
	                        <strong>PLEASE READ</strong>
	                    </h2>
	                    <hr>
	                    <!--
	                    <img class="img-responsive img-border img-left" src="img/intro-pic.jpg" alt="">
	                    -->
	                    <hr class="visible-xs">
	                    <hr>
	                    <br>
	                    <p align = "center">* 1시간 단위로만 예약이 가능합니다 *</p>
	                    <p align = "center">* TIME : 24HR 단위로 입력해 주세요 *</p>
	                    <p align = "center">* DAY : M/T/W/TH/F *</p>
	                    <p align = "center">* 예시: T 1000 - 1100, TH 1830 - 1930 * </p>
	                </div>
	            </div>
	        </div>
		<form action = "search.board" method = "" name = "search_form">

			<table border = "1" cellpadding = "1" cellspacing = "1">
				<tr>
					<td align = "center">시작 시간</td>
					<td align = "center"><input type = "text" name = "starttime"></td>
				</tr>
				<tr>
					<td align = "center">예약 시간</td>
					<td align = "center"><input type = "text" name = "endtime"></td>
				</tr>
				<tr>
					<td align = "center">요일</td>
					<td align = "center"><input type = "text" name = "day"></td>
				</tr>
			</table>
			<br>
			<input type = "button" class = "btn btn-default" value = "SEARCH" onclick = "search()">
			<!-- onclick 속성에는 자바스크립트 함수만 넣을 수 있음. 위에서 type에 button을 넣었기 때문에 js > member.js의 infoConfirm()에 submit 기능 넣어 줌. -->
			&nbsp;&nbsp;
			<input type = "reset" class = "btn btn-default" value = "CANCEL" onclick = "javascript:location.href='/decadance'">
		</form>
	</div>



	<jsp:include page="../include/footer.jsp"/>
</body>
</html>