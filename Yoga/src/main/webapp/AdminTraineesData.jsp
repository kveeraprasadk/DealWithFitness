<%@page import="java.util.*" %>
<%@page import="main.model.TrainerDetailsVO" %>
<%@page import="main.model.TraineeStory" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet"> 
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/fontawesome.css" />
    	<link rel="stylesheet" href="assets/css/templatemo-style.css" />
    	<link rel="stylesheet" href="assets/css/owl.css" />
    	<link rel="stylesheet" href="assets/css/lightbox.css" />
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
       
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js" defer></script>
	<!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="./dist/dialogs.js"></script> 
        
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script src="assets/js/isotope.min.js"></script>
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/lightbox.js"></script>
    <script src="assets/js/custom.js"></script>
    <script>
      //according to loftblog tut
      $(".main-menu li:first").addClass("active");

      var showSection = function showSection(section, isAnimate) {
        var direction = section.replace(/#/, ""),
          reqSection = $(".section").filter(
            '[data-section="' + direction + '"]'
          ),
          reqSectionPos = reqSection.offset().top - 0;

        if (isAnimate) {
          $("body, html").animate(
            {
              scrollTop: reqSectionPos
            },
            800
          );
        } else {
          $("body, html").scrollTop(reqSectionPos);
        }
      };

      var checkSection = function checkSection() {
        $(".section").each(function() {
          var $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
          if (topEdge < wScroll && bottomEdge > wScroll) {
            var currentId = $this.data("section"),
              reqLink = $("a").filter("[href*=\\#" + currentId + "]");
            reqLink
              .closest("li")
              .addClass("active")
              .siblings()
              .removeClass("active");
          }
        });
      };

      $(".main-menu").on("click", "a", function(e) {
        e.preventDefault();
        showSection($(this).attr("href"), true);
      });

      $(window).scroll(function() {
        checkSection();
      });
    </script>
        <style type="text/css">
        .bg-gradient-default {
  background: linear-gradient(87deg, #172b4d 0, #1a174d 100%) !important;
}
.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #14e3bd !important;
}
        </style>
    </head>

    <body onLoad="LoadingTrainersProfileData()">
    <script type="text/javascript">
     function LoadingTrainersProfileData(){
    	 
    	 $.ajax({

    		 type: 'GET',
    		 url: "${pageContext.request.contextPath}/TraineeAdminApprovedListServlet",
    		 
    	 });
    	 
     }
    
    
</script>
        <!-- Top Bar Start -->
        <div class="top-bar d-none d-md-block">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
           
                    </div>
                    <div class="col-md-4">
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Top Bar End -->

        <!-- Nav Bar Start -->
        
        <div class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                  <a  class="navbar-brand">dealwithfitness <span> </span></a> 
          <!--    <img alt="yogalogo" height="8%"; width="8%" src="./img/yogalogo.jpg"> -->
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav ml-auto">           
                      
                          <ul class="main-menu">
                <li><a href="./AdminPageView" class="nav-item nav-link ">Requests</a></li>
                <li><a href="./AdminTrainersList" class="nav-item nav-link ">Trainers</a></li>
                <li><a href="./AdminTraineesList" class="nav-item nav-link active">Trainees</a></li>
         <!--        <li><a href="#section4" class="nav-item nav-link ">Modifications</a></li>   -->
                
              </ul> 
                        <a href="./AdminLogoutServlet" class="nav-item nav-link ">Logout</a>
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
                        <h2>Active Trainees</h2>
                    </div>
                    <div class="col-12">
                        <a href="./AdminPageView">Home</a>
                        <a href="./AdminTraineesList">Trainees</a>
                    </div>   
                </div>
            </div>
                    
            
        </div>
       
        <!-- Page Header End -->


        <!-- About Start -->
        <div id="page-wraper">
         <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>     

	<section class="section trinees-list" data-section="section3">
        <div class="container">
          <div class="section-heading">
            <h2>Trainees List</h2>
            <div class="line-dec"></div>
            <span>
            Total Registered Trainees List
              </span>
          </div>
          <div class="row">
    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
              <div class="service-item">
          <!--       <div class="first-service-icon service-icon"></div>   -->
                <h4>Active Trainees </h4>
                <div style="overflow-x:auto;">
  <table class="table table-bordered">
    <tr>
      <th>Name</th>
      <th>Email</th>  
      <th>DataOfBirth</th>          
      <th>Target</th>
      <th>Ailment</th>
      <th>State</th>
      <th>city</th>
      <th>Phone</th>      
      <th>CreationTime</th>
<!--       <th></th> -->
      
    </tr>
     <% ArrayList<TrainerDetailsVO> traineeslist = (ArrayList<TrainerDetailsVO>) request.getAttribute("TraineesList"); %>


<%
// Iterating through subjectList
if(traineeslist != null && traineeslist.size() >0)  // Null check for the object
{
	Iterator<TrainerDetailsVO> iterator = traineeslist.iterator();  // Iterator interface
	int inv=0;
	for (TrainerDetailsVO tList: traineeslist)  // iterate through all the data until the last record
	{
		//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
	inv++;
//	System.out.println("My Investor: "+ trainerdetails.getName());
	
	%>
    <tr>
    	<td><%=tList.getName() %></td>
      <td><%=tList.getEmail() %></td>      
       <td><%=tList.getDob() %></td>
      <td><%=tList.getTarget() %></td>
      <td><%=tList.getAnyailment() %></td>
      <td><%=tList.getState() %></td>
      <td><%=tList.getCity() %></td>
       <td><%=tList.getPhone() %></td>       
      <td><%=tList.getCreatetime() %></td>
<!--       <td ><button class="white-button">Update</button></td> -->
    </tr>
     <%
							}
						}
					%> 
  </table>
</div>
        </div>
        </div>
          </div>
        </div>
      </section>    
    </div>
        <!-- About End -->
        

       <!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->
	
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
    </body>
</html>
