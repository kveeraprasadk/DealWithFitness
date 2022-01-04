<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<title>DealWithFitness</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free Website Template" name="keywords">
<meta content="Free Website Template" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap"
	rel="stylesheet">

<!-- CSS Libraries -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/common.css">
<script src="./js/jquery.min.js"></script>

<script src="./dist/utils.js"></script>
<script src="./dist/dialogs.js"></script>
<script src="./dist/whoami.js"></script>
<script src="./dist/trainee-journey.js"></script>

<!-- JavaScript Libraries -->
<script src="./js/bootstrap.bundle.min.js" ></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/wow/wow.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/isotope/isotope.pkgd.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="./dist/external/moment.min.js"></script>

<!-- Added this for fixating the header otherwise not needed -->
<script src="js/main.js"></script>
<script src="assets/js/scripts.js"></script>



</head>
<script>
	function init() {	
		
		whoami.detect();
	}

</script>
<body onload="init()">
	<!-- Nav Bar Start -->
	<%@include file="./html/navbar.html"%>
	<%@include file="./html/dialogs.html"%>
	<!-- Nav Bar End -->

	<!-- Page Header Start -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2>Terms And Conditions</h2>
				</div>
			</div>
		</div>
	</div>
	<div class="class">
		<div class="container">
			
			<div class="flex-column col-md-12  col-sm-12 col-lg-12 card">				
				<div>
					<%@include file="./html/TermsandConditions.html"%>
				</div>
			</div>	
			<div class="flex-column col-md-12  col-sm-12 col-lg-12 card">				
				<div>
					<%@include file="./html/Terms.html"%>
				</div>
			</div>
			
		</div>
	</div>


<!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>



</body>
</html>