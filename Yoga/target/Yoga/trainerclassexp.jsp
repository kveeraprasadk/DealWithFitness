<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<%@page import="main.model.TrainerDetailsVO" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional/ /EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>DEALWITHFITNESS</title>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>
    <!-- jQuery library -->
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style type="text/css">
.personalfont {
   
  
    font-size: 2rem !important;
    
}
        </style>
    </head>

    <body >
    
      <script type="text/javascript">
      $(document).ready(function () {
    	     	  
    	  $("select").change(function () {
    		  
    		  event.preventDefault();
    		  var exp=$('#form-expertise').val();
    		  alert(exp);
    		  $.ajax({
                  url: "TrainerClassListOptionalServlet",
                  type: "Get",
                  data: {
                	  expertise : exp
                  	
                  },
                  cache: false,
                  success: function (data) {
                	  console.log(data);
                   	  
                   		 
                   		  document.location.href='./classexpertiselist?expertise='+exp;
                         	                 
                         },
                     error: function (data) {
                    	 
                         $('#success').html("<div class='alert alert-danger'>");
                         $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                 .append("</button>");
                         $('#success > .alert-danger').append($("<strong>").text( data));
                         $('#success > .alert-danger').append('</div>');
                         
                     }
    		  });
    	  });
      });
      </script>
        <!-- Top Bar Start -->
        <div class="top-bar d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                    <!--     <div class="top-bar-left">
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
                        </div>   -->
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
                <a href="index.jsp" class="navbar-brand">Dealwithfitness <span> </span></a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">
                               <a href="TrainerHome.jsp" class="nav-item nav-link">Home</a>
                                     
						<a href="./TrainerClass" class="nav-item nav-link active">Class</a>
                     
                     <a href="./TrainerProfile" class="nav-item nav-link">Profile</a>
                       
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
                        <h2>Class</h2>
                    </div>
                    <div class="col-12">
                        <a href="TrainerHome.jsp">Home</a>
                        <a href="">Class</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


         <!-- Class Start -->
        <div class="class">
            <div class="container">
                <div class="section-header text-center wow zoomIn" data-wow-delay="0.1s">
                
                    <p>Select Your Yoga Coach</p>
                    <h2>Yoga Class Shedule</h2>
                    <select name="form-expertise" id="form-expertise" class="form-control required" onfocus='this.size=5;' onblur='this.size=1;' onchange='this.size=1; this.blur(); saveValue(this);'  required>
    				<option value="all">Expertise</option>
    				<option value="Yoga for health">Yoga for health</option>
    				<option value="Weight Loss">Weight Loss</option>
    				<option value="Kids Yoga">Kids Yoga</option>
    				<option value="Pregnancy Yoga">Pregnancy Yoga</option>
    				<option value="Meditation">Meditation</option>
    				</select>
    				<div class="hero-btn">
                               
                               
                            </div>
                </div>
                
                <div class="row class-container">
                <%
                ArrayList<TrainerDetailsVO> trainers = (ArrayList<TrainerDetailsVO>) request.getAttribute("AllTrainersList");
                %>


<%
// Iterating through subjectList
if(trainers != null && trainers.size() >0)  // Null check for the object
{
	Iterator<TrainerDetailsVO> iterator = trainers.iterator();  // Iterator interface
	int inv=0;
	for (TrainerDetailsVO trainerdetails: trainers)  // iterate through all the data until the last record
	{
		//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
	inv++;
//	System.out.println("My Investor: "+ trainerdetails.getName());
%>
                    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="class-wrap">
                           <div class="class-img"> 
                               <h2><%=trainerdetails.getExpertise() %></h2><br>
		<!-- 							 <img src="data:image/jpg;base64,${trainerdetails.base64Image}"  alt="Image"/>   -->
			<!--  							<img src="<%=trainerdetails.getBase64Image() %>" alt="Image">-->
                           </div>
                             <div class="class-text">
                                <div class="class-teacher">
                <!--                     <img src="img/teacher-1.png" alt="Image">   -->
                                    <h3><%=trainerdetails.getName() %></h3>
                                    <a>
                                    <button class="btn personalfont profiledata" value="<%=trainerdetails.getEmail() %>">+</button>
                                    </a>
                                </div>
                                <h2><%=trainerdetails.getClasslevel() %></h2>
                                
                               
                                <div class="class-meta">
                          <!--           <p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>   -->
                                    <p><i class="far fa-clock"></i><%=trainerdetails.getSchedule() %></p><br>
                                  
                                   
                                </div>
                                 <div class="class-meta">
                        
                                   <p> <Strong>Fees : <i class="fa fa-inr"> </i><%=trainerdetails.getMonthlyfees() %></Strong></p>
                                   
                                </div>
                                 
                            </div>
                        </div>
                    </div>
                    <%
							}
						}
					%>       
                    
                </div>
            </div>
        </div>
        <!-- Class End -->
        
      


        <!-- Footer Start -->
        <div class="footer wow fadeIn" data-wow-delay="0.3s">
            <div class="container-fluid">
                <div class="container">
                    <div class="footer-info">
                        <a href="TrainerHome.jsp" class="footer-logo">DealWithFitness<span></span></a>
                        
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
    </body>
</html>
