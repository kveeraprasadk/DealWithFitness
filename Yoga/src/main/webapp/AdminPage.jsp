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
    		 url: "${pageContext.request.contextPath}/TrainerRequestServlet",
    		 
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
                <li><a href="#section1" class="nav-item nav-link ">Requests</a></li>
                <li><a href="#section2" class="nav-item nav-link ">Trainers</a></li>
                <li><a href="#section3" class="nav-item nav-link ">Trainees</a></li>
                <li><a href="#section4" class="nav-item nav-link ">Modifications</a></li>
                
              </ul>  
                        
                        
                        <a href="./AdminPageView" class="nav-item nav-link" >Admin</a>
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
                        <h2>Admin Home</h2>
                    </div>
           <!--          <div class="col-12">
                        <a href="index.jsp">Home</a>
                        <a href="./AdminPageView">Admin</a>
                    </div>   -->
                </div>
            </div>
                    
            
        </div>
       
        <!-- Page Header End -->


        <!-- About Start -->
        <div id="page-wraper">
         <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Sidebar Menu 
      <div class="responsive-nav">
        <i class="fa fa-bars" id="menu-toggle"></i>
        <div id="menu" class="menu">
          <i class="fa fa-times" id="menu-close"></i>
          <div class="container">
              <div class="image">
              <a href="#"><img src="assets/images/author-image.jpg" alt="" /></a>
            </div>   
            <div class="author-content">
              <h4>DealWithFitness</h4>
              <span>Administrator</span>
            </div>
            <nav class="main-nav" role="navigation">
              <ul class="main-menu">
                <li><a href="#section1">About Me</a></li>
                <li><a href="#section2">What I’m good at</a></li>
                <li><a href="#section3">My Work</a></li>
                <li><a href="#section4">Contact Me</a></li>
              </ul>
            </nav>
            <div class="social-network">
              <ul class="soial-icons">
                <li>
                  <a href="https://fb.com/templatemo"
                    ><i class="fa fa-facebook"></i
                  ></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-linkedin"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-dribbble"></i></a>
                </li>
                <li>
                  <a href="#"><i class="fa fa-rss"></i></a>
                </li>
              </ul>
            </div>
            <div class="copyright-text">
              <p>Copyright 2019 Reflux Design</p>
            </div>
          </div>
        </div>
      </div>
-->
      <section class="section trainer-requests" data-section="section1">
        <div class="container">
          <div class="section-heading">
            <h2>Trainers Requests</h2>
            <div class="line-dec"></div>
            <span>
            The following are all Trainers Requests list. Please check the details and <b>CONFIRM</b> it. Once you are confirm it automated password will be generated and sent to trainers registered email.<br>
            
            <b>! Important :</b> There is any details you need to modify, the update option is available in the Trainers List table.<br>
             </span>
    <div class="alert alert-success" id="msgsuccess-alert">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <h4><strong> <div id="requestsuccess"> </div></strong></h4>
</div>
<div class="alert alert-danger" id="msgdanger-alert">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <h4><strong> <div id="requestfail"> </div></strong></h4>
</div>
          </div>
          <script type="text/javascript">
          $(document).ready(function(){
	$('#msgsuccess-alert').hide();
	 $('#msgdanger-alert').hide();
          });
	 </script>
   
          <% ArrayList<TrainerDetailsVO> trainersreq = (ArrayList<TrainerDetailsVO>) request.getAttribute("TrainerRequests"); %>


<%
// Iterating through subjectList
if(trainersreq != null && trainersreq.size() >0)  // Null check for the object
{
	Iterator<TrainerDetailsVO> iterator = trainersreq.iterator();  // Iterator interface
	int inv=0;
	for (TrainerDetailsVO trainerrequest: trainersreq)  // iterate through all the data until the last record
	{
		//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
	inv++;
//	System.out.println("My Investor: "+ trainerdetails.getName());
	
	%>
          <div class="right-image-post service-item">
            <div class="row ">
              <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                <div class="left-text">
                  <h5>Name : <b><%=trainerrequest.getName() %></b><br></h5>
                  <h5>Email :<b><%=trainerrequest.getEmail() %></b><br></h5>
                  <h5>Expertise :<b><%=trainerrequest.getExpertise() %></b><br></h5>
                  <h5>Experience :<b><%=trainerrequest.getExperience() %></b><br></h5>
                  <h5>Qualification :<b><%=trainerrequest.getQualification() %></b><br></h5>
                 
                </div>
              </div>
              <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
             <!--    <div class="right-image">
                  <img src="assets/images/right-image.jpg" alt="" />
                </div>    -->
                <h5>About Trainer :<b><%=trainerrequest.getAboutyourself() %></b><br></h5>
                <h5>ProfilePicture :<b><%=trainerrequest.getFilename() %></b><br></h5>
                <h5>Certificates :<b><%=trainerrequest.getCertificate1filename() %></b><br>
                					<b><%=trainerrequest.getCertificate2filename() %></b><br>
                					<b><%=trainerrequest.getCertificate3filename() %></b><br></h5>
                <h5>CreationTime :<b><%=trainerrequest.getCreatetime() %></b><br></h5>
                <button class="white-button confirmbutton" value="<%=trainerrequest.getEmail() %>"> Confirm </button>
                <button class="white-button deletebutton" value="<%=trainerrequest.getEmail() %>"> Delete </button>
                  
                  
              </div>
            </div>
          </div>
          <%
							}
						}else{  %>
							<h3>No Requests.</h3>
							<% 
						}
					%> 
          
        </div>
        
        <div class="container">
          <div class="section-heading">
            <h2>Trainee Story Requests</h2>
            <div class="line-dec"></div>
            <span>
            The following are all Trainee Story Requests list. Please check the details and <b>CONFIRM</b> it. Once you are confirm it the Confirmation mail will be sent to trainees registered email.<br>
            
            
             </span>
    <div class="alert alert-success" id="storysuccess-alert">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <h4><strong> <div id="requestsuccess"> </div></strong></h4>
</div>
<div class="alert alert-danger" id="storydanger-alert">
  <button type="button" class="close" data-dismiss="alert">x</button>
  <h4><strong> <div id="requestfail"> </div></strong></h4>
</div>
          </div>
          <script type="text/javascript">
          $(document).ready(function(){
	$('#storysuccess-alert').hide();
	 $('#storydanger-alert').hide();
          });
	 </script>
   
<div class="row">
   <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
              <div class="service-item">
          <!--       <div class="first-service-icon service-icon"></div>   -->
                <h4>All the Requests </h4>
                <div style="overflow-x:auto;">
  <table class="table table-bordered">
    <tr>
      <th>TraineeId</th>
      <th>TrainerId</th>
      <th>Story</th>
      <th>Photo1</th>
      <th>Photo2</th>     
      <th>CreationTime</th>
      <th></th>
      
    </tr>
     <% ArrayList<TraineeStory> traineestoryrequest = (ArrayList<TraineeStory>) request.getAttribute("TraineeStoryRequest"); %>


<%
// Iterating through subjectList
if(traineestoryrequest != null && traineestoryrequest.size() >0)  // Null check for the object
{
	Iterator<TraineeStory> iterator = traineestoryrequest.iterator();  // Iterator interface
	int inv=0;
	for (TraineeStory tList: traineestoryrequest)  // iterate through all the data until the last record
	{
		//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
	inv++;
//	System.out.println("My Investor: "+ trainerdetails.getName());
	
	%>
    <tr>
      <td><%=tList.getTraineeId() %></td>
      <td><%=tList.getTrainerId() %></td>
      <td><%=tList.getStory() %></td>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/TraineeStoryPhoto1DownloadServlet?user=<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>,<%=tList.getFilename1() %>"><%=tList.getFilename1() %></a>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/TraineeStoryPhoto2DownloadServlet?user=<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>,<%=tList.getFilename2() %>"><%=tList.getFilename2() %></a>     
      <td><%=tList.getTrainerName() %></td>
    
      <td> 
      
       <button type="button" class="white-button traineestoryconfirmbutton" id="traineestoryupdate<%=inv %>t" value="<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>">Approve</button> 
      
      </td>
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
      <script>
            $(document).on("click", ".traineestoryconfirmbutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            
            var temail = $(this).val();
      	 
                $.post("TraineeStoryConfirmServlet",{traineetrainer:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
               console.log(responseText);
                if(responseText=="Trainee Story Confirmed Successfully"){
                	$(".traineestoryconfirmbutton").prop('disabled', true);
                	document.location.href='./AdminPageView';
              
                	$('#successmsg').text(responseText);             	
                         	
                }
                else
                	{
                	
                  	$('#failmsg').text(responseText);
                  	
                	}
                });
            });
 </script>
<script>
            $(document).on("click", ".confirmbutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            
            var temail = $(this).val();
      	 
                $.post("TrainersConfirmServlet",{traineremail:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
               console.log(responseText);
                if(responseText=="Trainer Confirmed Successfully"){
                	$(".confirmbutton").prop('disabled', true);
                	document.location.href='./AdminPageView';
              
                	$('#successmsg').text(responseText);             	
                         	
                }
                else
                	{
                	
                  	$('#failmsg').text(responseText);
                  	
                	}
                });
            });
 </script>
 <script>
            $(document).on("click", ".deletebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            
            var temail = $(this).val();
      	 
                $.post("TrainerRequestDeleteServlet",{traineremail:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
               console.log(responseText);
                if(responseText=="Trainer Confirmed Successfully"){
                	$(".confirmbutton").prop('disabled', true);
                	document.location.href='./AdminPageView';
              
                	$('#successmsg').text(responseText);             	
                         	
                }
                else
                	{
                	
                  	$('#failmsg').text(responseText);
                  	
                	}
                });
            });
        </script>
      <section class="section triners-list" data-section="section2">
        <div class="container">
          <div class="section-heading">
            <h2>Trainers List</h2>
            <div class="line-dec"></div>
            <span>
            Total Registered Trainers List
              </span>
          </div>
          <div class="row">
   <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
              <div class="service-item">
          <!--       <div class="first-service-icon service-icon"></div>   -->
                <h4>Active Trainers </h4>
                <div style="overflow-x:auto;">
  <table class="table table-bordered">
    <tr>
      <th>Name</th>
      <th>Email</th>
      <th>Expertise</th>
      <th>Experience</th>
      <th>Qualification</th>
     
      <th>AboutTrainer</th>
      <th>Profile</th>
      <th>Certificates</th>
      <th>CreationTime</th>
      <th></th>
      
    </tr>
     <% ArrayList<TrainerDetailsVO> trainerslist = (ArrayList<TrainerDetailsVO>) request.getAttribute("TrainersList"); %>


<%
// Iterating through subjectList
if(trainerslist != null && trainerslist.size() >0)  // Null check for the object
{
	Iterator<TrainerDetailsVO> iterator = trainerslist.iterator();  // Iterator interface
	int inv=0;
	for (TrainerDetailsVO tList: trainerslist)  // iterate through all the data until the last record
	{
		//InvestorExpertNamemodel myinvestordetails = iterator.next(); //assign individual employee record to the employee class object
	inv++;
//	System.out.println("My Investor: "+ trainerdetails.getName());
	
	%>
    <tr>
      <td><%=tList.getName() %></td>
      <td><%=tList.getEmail() %></td>
      <td><%=tList.getExpertise() %></td>
      <td><%=tList.getExperience() %></td>
      <td><%=tList.getQualification() %></td>
      
      <td><%=tList.getAboutyourself() %></td>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/AdminCertificateDownloadServlet?user=<%=tList.getEmail() %>,<%=tList.getFilename() %>"><%=tList.getFilename() %></a></td>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate1DownloadServlet?user=<%=tList.getEmail() %>,<%=tList.getCertificate1filename() %>"><%=tList.getCertificate1filename() %></a>
 		<br>
      	  <a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate2DownloadServlet?user=<%=tList.getEmail() %>,<%=tList.getCertificate2filename() %>"><%=tList.getCertificate2filename() %></a><br>
      	  <a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/AdminCertificate3DownloadServlet?user=<%=tList.getEmail() %>,<%=tList.getCertificate3filename() %>"><%=tList.getCertificate3filename() %></a>
      	  </td>
      <td><%=tList.getCreatetime() %></td>
    
      <td ><div id="trname<%=inv%>t" data-msg="<%=tList.getName() %>"></div>
      <div id="tremail<%=inv%>t" data-msg="<%=tList.getEmail() %>"></div>
      <div id="trexpertise<%=inv%>t" data-msg="<%=tList.getExpertise() %>"></div>
    
      <div id="traboutyourself<%=inv%>t" data-msg="<%=tList.getAboutyourself() %>"></div>
    <!--   <button type="button" class="white-button trainersupdatebutton" id="trainersupdate<%=inv %>t" data-count="<%=inv %>t" value="<%=tList.getEmail() %>">Update</button>  -->
      <ul class="main-menu">
      <li><a href="#section4" class="white-button trainersupdatebutton" id="trainersupdate<%=inv %>t" data-count="<%=inv %>t" value="<%=tList.getEmail() %>">Update</a></li>
      </ul>
      </td>
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
       <script type="text/javascript">
          $(document).ready(function(){
        	  $(".trainersupdatebutton").click(function(){
        			
        				var count=$(this).attr("data-count");
        				$("#name").val($("#trname"+count).attr("data-msg"));
        				$("#email").val($("#tremail"+count).attr("data-msg"));
        				$("#expertise").val($("#trexpertise"+count).attr("data-msg"));
        				$("#monthlyfees").val($("#trmonthlyfees"+count).attr("data-msg"));
        				$("#schedule").val($("#trschedule"+count).attr("data-msg"));
        				$("#classlevel").val($("#trclasslevel"+count).attr("data-msg"));
        				$("#message").val($("#traboutyourself"+count).attr("data-msg"));
        			
        		});
          });
	 </script>
	 <script>
            $(document).on("click", ".downloadcertificate", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            	var tid=$(this).val();
                $.get("AdminCertificateDownloadServlet",{user : tid}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
                	if(responseText != "Success"){
                		
                  		
                  		
                	}else{
                	$('#failmsg').text(responseText);
                	}
               
                });
            });
        </script>
        <script>
            $(document).on("click", ".downloadcertificate1", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            	var tid=$(this).val();
                $.get("AdminCertificate1DownloadServlet",{user : tid}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
                	if(responseText != "Success"){
                		
                  		
                  		
                	}else{
                	$('#failmsg').text(responseText);
                	}
               
                });
            });
        </script>
        <script>
            $(document).on("click", ".downloadcertificate2", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            	var tid=$(this).val();
                $.get("AdminCertificate2DownloadServlet",{user : tid}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
                	if(responseText != "Success"){
                		
                  		
                  		
                	}else{
                	$('#failmsg').text(responseText);
                	}
               
                });
            });
        </script>
        <script>
            $(document).on("click", ".downloadcertificate3", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            	var tid=$(this).val();
                $.get("AdminCertificate3DownloadServlet",{user : tid}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	
                	if(responseText != "Success"){
                		
                  		
                  		
                	}else{
                	$('#failmsg').text(responseText);
                	}
               
                });
            });
        </script>
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
      <th>Target</th>
      <th>Ailment</th>
      <th>city</th>
      <th>Phone</th>
      <th>Password</th>
      <th>CreationTime</th>
      <th></th>
      
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
      <td><%=tList.getTarget() %></td>
      <td><%=tList.getAnyailment() %></td>
      <td><%=tList.getCity() %></td>
       <td><%=tList.getPhone() %></td>
      <td><%=tList.getPassword() %></td>     
      <td><%=tList.getCreatetime() %></td>
      <td ><button class="white-button">Update</button></td>
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
      

      <section class="section Modify-details" data-section="section4">
        <div class="container">
          <div class="section-heading">
            <h2>Modify Details</h2>
            <div class="line-dec"></div>
            <span>
            Please modify the values whatever you want to change in Trainers and Trainees profiles.<br>
            <b>! important :</b>Email id can't be modify.
              </span>
          </div>
          <div class="row">
            <div class="right-content">
              <div class="container">
                <form id="contact" action="" method="">
                  <div class="row">
                    <div class="col-md-6">
                    
                      <fieldset>
                        <input
                          name="name"
                          type="text"
                          class="form-control"
                          id="name"
                          placeholder="Your name..."
                          required=""
                        />
                      </fieldset>
                    </div>
                    <div class="col-md-6">
                      <fieldset>
                        <input
                          name="email"
                          type="text"
                          class="form-control"
                          id="email"
                          placeholder="Your email..."
                          disabled="disabled"
                        />
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <input
                          name="expertise"
                          type="text"
                          class="form-control"
                          id="expertise"
                          placeholder="Your expertise..."
                          required=""
                        />
                      </fieldset>
                    </div>
                   
                   
                    
                    <div class="col-md-12">
                      <fieldset>
                        <textarea
                          name="message"
                          rows="6"
                          class="form-control"
                          id="message"
                          placeholder="About yourself..."
                          required=""
                        ></textarea>
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="form-submit" class="button">
                          Update
                        </button>
                      </fieldset>
                    </div>
                    <div id="success"></div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
      
       <section class="section Change-password" data-section="section5">
        <div class="container">
          <div class="section-heading">
            <h2>Change Password</h2>
            <div class="line-dec"></div>
            <span>
            Please update your password by using the current password.
              </span>
          </div>
          <div class="row">
            <div class="right-content">
              <div class="container">
                <form id="adminchangepassword" name="adminchangepassword">
                  <div class="row">         
                    
                    
                    <div class="col-md-12">
                      <fieldset>
                        <input
                          name="currentpassword"
                          type="text"
                          class="form-control"
                          id="currentpassword"
                          placeholder="currentpassword..."
                          required
                        />
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <input
                          name="newpassword"
                          type="text"
                          class="form-control"
                          id="newpassword"
                          placeholder="newpassword..."
                          required
                        />
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <input
                          name="confirmpassword"
                          type="text"
                          class="form-control"
                          id="confirmpassword"
                          placeholder="confirmpassword..."
                          required
                        />
                      </fieldset>
                    </div>
                    <div class="col-md-12">
                      <fieldset>
                        <button type="submit" id="changepasswordbutton" class="button">
                          Update
                        </button>
                      </fieldset>
                    </div>
                    <div id="passwordsuccess"></div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>
        <!-- About End -->
        <script type="text/javascript">
$(document).ready(function(){
$("#adminchangepassword").validate({
 rules: {
	currentpassword: {
	        required: true, 
	        minlength: 6
	      },
	
	      newpassword: {
        required: true, 
        minlength: 6
      },
      confirmpassword:{
	  required: true,
	  equalTo:"#newpassword"
	  }
    },
    messages : {
    	currentpassword: {
            required: "please enter password",
            minlength: "Password min 6 characters"
          },
          newpassword: {
        required: "please enter password",
        minlength: "Password min 6 characters"
      },
      confirmpassword: {
		required: "please enter confirm password",
		equalTo: "password doesn match"
	  }
    }
  });
 
  
});
</script>  
<script type="text/javascript">
          $(document).ready(function(){
        	  $("#changepasswordbutton").click(function(){
        			
        		  event.preventDefault();
        		  var currentpass=$('#currentpassword').val();
                  var newpass=$('#newpassword').val();
                  var confirmpass=$('#confirmpassword').val();
                 
                $.ajax({
                      url: "AdminChangePasswordServlet",
                      type: "POST",
                      data: {
                    	  currentpassword : currentpass,
                    	  newpassword : newpass,
                    	  confirmpassword : confirmpass
                      },
                      cache: false,
                     
                    	  success: function (data) {
                            	
                              $('#passwordsuccess').html("<div class='alert alert-success'>");
                              $('#passwordsuccess > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                      .append("</button>");
                              $('#passwordsuccess > .alert-success')
                                      .append("<strong>"+data+". </strong>");
                              $('#passwordsuccess > .alert-success')
                                      .append('</div>');
                              $('#adminchangepassword').clear();
                          },
                          error: function () {
                              $('#passwordsuccess').html("<div class='alert alert-danger'>");
                              $('#passwordsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                      .append("</button>");
                              $('#passwordsuccess > .alert-danger').append($("<strong>").text("Sorry " + name + ", update failed. Please try again later!"));
                              $('#passwordsuccess > .alert-danger').append('</div>');
                             
                          }
                      
                  });
        			
        		});
          });
	 </script>  
 <script type="text/javascript">
          $(document).ready(function(){
        	  $("#form-submit").click(function(){
        			
        		  event.preventDefault();
                  var name = $("#name").val();
                  var email = $("#email").val();
                  var exp = $("#expertise").val();
                  var mfees = $("#monthlyfees").val();
                  var schedule = $("#schedule").val();
                  var classlevel = $("#classlevel").val();
                  var message = $("#message").val();
                  
                 
                
                  $.ajax({
                      url: "TrainerDetailsUpdateServlet",
                      type: "POST",
                      data: {
                          name: name,
                          email: email,
                          expertise: exp,
                          monthlyfees: mfees,
                          schedule: schedule,
                          classlevel: classlevel,
                          aboutyourself: message
                      },
                      cache: false,
                      success: function () {
                      	
                          $('#success').html("<div class='alert alert-success'>");
                          $('#success > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                  .append("</button>");
                          $('#success > .alert-success')
                                  .append("<strong>Updated Successfully. </strong>");
                          $('#success > .alert-success')
                                  .append('</div>');
                          $('#contactForm').trigger("reset");
                      },
                      error: function () {
                          $('#success').html("<div class='alert alert-danger'>");
                          $('#success > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                  .append("</button>");
                          $('#success > .alert-danger').append($("<strong>").text("Sorry " + name + ", update failed. Please try again later!"));
                          $('#success > .alert-danger').append('</div>');
                          $('#contactForm').trigger("reset");
                      }
                      
                  });
        			
        		});
          });
	 </script>       


       <!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->
	
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
    </body>
</html>
