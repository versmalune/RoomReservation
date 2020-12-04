<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>My Classroom!</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</head>

<body>
	<jsp:include page="include/header.jsp"/>
 
    <div class="container">
    
        <div class="row">
            <div class="box">
                <div class="col-lg-12 text-center">

                    <h2 class="brand-before">
                        <small>Classroom Reservation System</small>
                    </h2>
                    <h1 class="brand-name">For MJU Students and Professors</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>By
                            <strong>SW Engineering Project</strong>
                        </small>
                    </h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">HOW TO USE
                        <strong>PLEASE READ</strong>
                    </h2>
                    <hr>
                    <hr class="visible-xs">
                    <hr>
                    <br>
                    <p align = "center">* Only authorized users can make reservations *</p>
                    <p align = "center">* Login in needed for full usage *</p>
                    <p align = "center">* For the time being, only res function is activated * </p>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="include/footer.jsp"/> 
</body>
</html>