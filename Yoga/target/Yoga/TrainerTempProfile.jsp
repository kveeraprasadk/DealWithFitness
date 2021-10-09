<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.util.*" %>
<%@page import="main.model.TrainerDetailsVO" %>
<%@ page isELIgnored="false" %>
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
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
		
		 <link rel="shortcut icon" href="profile/images/fav.jpg">
    <link rel="stylesheet" href="profile/css/bootstrap.min.css">
    <link rel="stylesheet" href="profile/css/fontawsom-all.min.css">
    <link rel="stylesheet" type="text/css" href="profile/css/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <!-- jQuery library -->
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body >
   
        <!-- Top Bar Start -->
        <div class="top-bar d-none d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
           <!--              <div class="top-bar-left">
                            <div class="text">
                                <i class="far fa-clock"></i>
                                <h2>8:00 - 9:00</h2>
                                <p>Mon - Fri</p>
                            </div>
                            <div class="text">
                                <i class="fa fa-phone-alt"></i>
                                <h2>+123 456 7890</h2>
                                <p>For Appointment</p>
                            </div>
                        </div>    -->
                    </div>
                    <div class="col-md-4">
                        <div class="top-bar-right">
                            <div class="social">
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                                <a href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar End -->

        <!-- Nav Bar Start -->
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand">Dealwithfitness<span></span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                  <!--      <a href="index.jsp" class="nav-item nav-link ">Home</a>
                        <a href="About.jsp" class="nav-item nav-link">About</a>                        
                        <a href="Trainer.jsp" class="nav-item nav-link">Trainer</a>
                   -->       
                         <a href="./TrainerLogoutServlet" class="nav-item nav-link">Logout</a>
                        
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Nav Bar End -->


        <!-- Page Header Start -->
        <div class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2>Trainers Profile</h2>
                    </div>
                    <div class="col-12">
                        <a href="index.jsp">Home</a>
                        <a href="">Trainers Profile</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- About Start -->
        <div class="container-fluid overcover">
        <div class="container profile-box">
           <div class="cover-image row">
      <!--           <img src="profile/images/bloogs-6.jpg" alt="">  --> 
           </div>
            
            <div class="row">
                <div class="col-lg-8 col-md-7 detail-px no-padding">
                   
                   <p><b>! Important :</b>This is one time profile login. Just now you register to DealWithFitness, DWF can provide your Access ID's as soon as possible.</p>
                    <h3 class="mth3">Profile</h3>
                    <div class="fx-ro">
                       
                        
                            Name : <b>${trainername}</b>
                            	 
                            
                     
                        
                    </div>
                    <div class="fx-ro">
                        
                            Experience	:	<b>${trainerexperience}</b>
                       
                       
                    </div>
                    <div class="fx-ro">
                        
                            Qualification	:	<b>${trainerqualification}</b>
                       
                       
                    </div>
                    <div class="fx-ro">
                        
                            Expertise	:	<b>${trainerexpertise}</b>
                       
                       
                    </div>
                     
                    
                    
                     <h3>About Trainer</h3>
                    <p><b>${traineraboutme}</b></p>
                    
                    <h3 class="mth3">Certificates</h3>
                    
                    <ul class="exrts">
                        <li>${trainercertificatefileName1}</li>
                        <li></li>
                        <li>${trainercertificatefileName2}</li>
                        <li></li>
                        <li>${trainercertificatefileName3}</li>
                        <li></li>
                    </ul>
                    
                </div>
                <div class="col-lg-4 col-md-5 leftgh">
                    <div class="img-box">
                         <img src="profile/images/gallery/gallery_12.jpg" alt="">   
                    </div>
                    <div class="name-det">                        
                   
                     <h2><div class="tname"></div></h2>
                     
                     <h3>Contact</h3>
                     
                     <p><b>${trainername}</b> <br>
                     <b>${traineremail}</b>
                     </p>
                     
                    </div>
                    
                </div>
            </div>
            
        </div>
    </div>
        <!-- About End -->


       


        <!-- Footer Start -->
        <div class="footer wow fadeIn" data-wow-delay="0.3s">
            <div class="container-fluid">
                <div class="container">
                    <div class="footer-info">
                        <a href="index.jsp" class="footer-logo">DealWithFitness<span></span></a>
                        
                        <div class="footer-menu">
                           
                            <p>dealwithfitness64@gmail.com</p>
                        </div>
                        <div class="footer-social">
                            <a href=""><i class="fab fa-twitter"></i></a>
                            <a href=""><i class="fab fa-facebook-f"></i></a>
                            <a href=""><i class="fab fa-youtube"></i></a>
                            <a href=""><i class="fab fa-instagram"></i></a>
                            <a href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                <div class="container copyright">
                    <div class="row">
                        <div class="col-md-6">
                            <p>&copy; <a href="#">dealwithfitness</a>, All Right Reserved.</p>
                        </div>
                        <div class="col-md-6">
                            <p>Designed By <Strong>Bluehorse Creative Team</Strong></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
<script src="profile/js/jquery-3.2.1.min.js"></script>
<script src="profile/js/popper.min.js"></script>
<script src="profile/js/bootstrap.min.js"></script>
<script src="profile/js/script.js"></script>
    </body>
</html>
