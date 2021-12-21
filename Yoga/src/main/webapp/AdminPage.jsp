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
		 <script src="https://rawgit.com/abdennour/bootstrap-waitingfor/master/build/bootstrap-waitingfor.js"></script>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/isotope/isotope.pkgd.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="./dist/utils.js"></script>
		<script src="./dist/dialogs.js"></script> 
 

        <!-- Template Javascript -->
        <script src="js/main.js"></script>          
        <script src="assets/js/isotope.min.js"></script>
    	<script src="assets/js/owl-carousel.js"></script>
    	<script src="assets/js/lightbox.js"></script>
    	<script src="assets/js/custom.js"></script>
    	
    	<script src="./dist/whoami.js"></script>

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
        .pop-outer{
        background-color : rgba(0,0,0,0.5);
        position : fixed;
        top : 0;
        left : 0;
        width : 100%;
        height : 100%;
        }
        .pop-inner{
        background-color : #fff;
        width : 500px;
        height : 100px;
        padding : 25px;
        margin : 15% auto;        
        }
        .pop-alert-outer{
        background-color : rgba(0,0,0,0.5);
        position : fixed;
        top : 0;
        left : 0;
        width : 100%;
        height : 100%;
        }
        .pop-alert-inner{
        background-color : #fff;
        width : 500px;
        height : 150px;
        padding : 25px;
        margin : 15% auto;        
        }
        .bg-gradient-default {
  background: linear-gradient(87deg, #172b4d 0, #1a174d 100%) !important;
}
.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #14e3bd !important;
}
label {
	color: #FF0000 !important;
}
        </style>
    </head>

    <body onLoad="LoadingTrainersProfileData()">
    <script type="text/javascript">
     function LoadingTrainersProfileData(){
    	 whoami.detect();
    	
    	 $.ajax({

    		 type: 'GET',
    		 url: "${pageContext.request.contextPath}/TrainerRequestServlet",
    		 
    	 }); 
    	
    	 const image = $("#trainer-profile-base64-encoded-element").val();
			if (image) {
				console.log("Profile picture present")
				$("#profile-image-element").attr("src",
						"data:image/*;base64," + image);
			} else {
				console.log("No profile picture");
			}		
     }    
</script>


       

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
                <li><a href="./AdminPageView" class="nav-item nav-link active">Requests</a></li>
                <li><a href="./AdminTrainersList" class="nav-item nav-link ">Trainers</a></li>
                <li><a href="./AdminTraineesList" class="nav-item nav-link ">Trainees</a></li>
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
                        <h2>Admin Home</h2>
                    </div>
                     <div class="col-12">
                        <a href="./AdminPageView">Home</a>
                        <a href="./AdminPageView">Requests</a>
                    </div>   
                </div>
            </div>            
        </div>       
        <!-- Page Header End -->


        <!-- About Start -->
      
  
        <div id="page-wraper">
         <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>      
      
      <section class="section trainer-requests" data-section="section1">
        <div class="container">      
          <div class="section-heading">
            <h2>Trainers Requests</h2>           
            <div class="line-dec"></div>
            <span>
            The following are all Trainers Requests list. Please check the details and <b>CONFIRM</b> it. Once you are confirm it automated password will be generated and sent to trainers registered email.<br>
            
            <b>! Important :</b> There is any details you need to modify, the update option is available in the Trainers List table.<br>
             </span>
   
          </div>
         
   
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
              <input type="hidden" id="trainer-profile-base64-encoded-element" 
						value="<%=trainerrequest.getBase64Image()%>" />
                <div class="left-text">
                <div class="bh-img">
							<img id="profile-image-element<%=inv %>"  alt="">							
						</div>
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
    
          </div>
         
   
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
      <th>StoryId</th>
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
      <td><%=tList.getStoryId() %></td>
      <td><%=tList.getStory() %></td>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/TraineeStoryPhoto1DownloadServlet?user=<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>,<%=tList.getFilename1() %>"><%=tList.getFilename1() %></a>
      <td><a class="downloadReport" target="_blank" href="http://localhost:8080/Yoga/TraineeStoryPhoto2DownloadServlet?user=<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>,<%=tList.getFilename2() %>"><%=tList.getFilename2() %></a>     
      <td><%=tList.getTrainerName() %></td>    
      <td>       
       <button type="button" class="white-button traineestoryconfirmbutton" id="traineestoryupdate<%=inv %>t" value="<%=tList.getTraineeId() %>,<%=tList.getTrainerId() %>,<%=tList.getStoryId() %>">Approve</button> 
       </td>
    </tr>
    
     <%
							}
						}else{  %>
						<tr>
						<td colspan="7">No Requests.</td>
						</tr>
						<% 
					}
				%> 
					
  </table>
  
</div>
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
                          type="password"
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
                          type="password"
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
                          type="password"
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
<!--      <button  id="modalbutton" class="open">modal</button> -->
                <div style="display : none" class="pop-outer">
                <div class="pop-inner">
                <h4>Please Wait...</h4>
<!--                 <button class="close">X</button> -->
                <div class="progress">
          <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
            <span class="sr-only">100% Complete (success)</span>
          </div>
        </div>
                </div>
                </div>
                
                
                
                <div style="display : none" class="pop-alert-outer">
                <div class="pop-alert-inner">                
               <div id="successmsg"></div>
               <center>
               <button class="close-alert">OK</button></center>
                </div>
                </div>
    
        <!-- About End -->
      <script type="text/javascript">
        $(document).on("click", ".confirmbutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
	
    var temail = $(this).val();
    $('.pop-outer').fadeIn('slow');
        $.post("TrainersConfirmServlet",{traineremail:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
        	
       console.log(responseText);
       $('.pop-outer').fadeOut('slow');
        if(responseText=="Trainer Confirmed Successfully"){
        	$(".confirmbutton").prop('disabled', true);
        	
        	$('#successmsg').html("<div class='alert alert-success'>");
            $('#successmsg > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                    .append("</button>");
            $('#successmsg > .alert-success')
                    .append("<strong>"+responseText+". </strong>");
            $('#successmsg > .alert-success')
                    .append('</div>');    
       
        	$('.pop-alert-outer').fadeIn('slow');        	
        	            	                     	
        }
        else
        	{        	
        	$('#successmsg').html("<div class='alert alert-danger'>");
            $('#successmsg > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                    .append("</button>");
            $('#successmsg > .alert-danger').append("<strong>"+responseText+". </strong>");
            $('#successmsg > .alert-danger').append('</div>');  
            
            $('.pop-alert-outer').fadeIn('slow');
            
        	
        	}
        
        });
    });
        </script> 
 <script type="text/javascript">
 $(document).ready(function() {
	 $('.open-alert').click(function(){
		 $('.pop-alert-outer').fadeIn('slow');
	 });
	 $('.open').click(function(){
		 $('.pop-outer').fadeIn('slow');
	 });
	 $('.close-alert').click(function(){
		 $('.pop-alert-outer').fadeOut('slow');
		 document.location.href='./AdminPageView'; 
	 });
	 $('.close').click(function(){
		 $('.pop-outer').fadeOut('slow');
		 document.location.href='./AdminPageView'; 
	 });
 });
 </script>

 <script type="text/javascript">
 
 
 $(document).on("click", ".traineestoryconfirmbutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...

	 var temail = $(this).val();
	 $('.pop-outer').fadeIn('slow');
	     $.post("TraineeStoryConfirmServlet",{traineetrainer:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
	     	
	    console.log(responseText);
	    $('.pop-outer').fadeOut('slow');
	     if(responseText=="Trainee Story Confirmed Successfully"){
	     	$(".traineestoryconfirmbutton").prop('disabled', true);     	 
	     	
	     	 $('#successmsg').html("<div class='alert alert-success'>");
             $('#successmsg > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                     .append("</button>");
             $('#successmsg > .alert-success')
                     .append("<strong>"+responseText+". </strong>");
             $('#successmsg > .alert-success')
                     .append('</div>');
             
             $('.pop-alert-outer').fadeIn('slow');
                  	      	
	     }
	     else
	     	{    	
	    	 $('#successmsg').html("<div class='alert alert-danger'>");
             $('#successmsg > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                     .append("</button>");
             $('#successmsg > .alert-danger').append("<strong>"+responseText+". </strong>");
             $('#successmsg > .alert-danger').append('</div>'); 
             
             $('.pop-alert-outer').fadeIn('slow');
             
	     	}
	     });
	 });
 </script>  
 <script type="text/javascript">
 $(document).on("click", ".deletebutton", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
		
	 	var temail = $(this).val();
	 	$('.pop-outer').fadeIn('slow');
	     $.post("TrainerRequestDeleteServlet",{traineremail:temail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
	     	
	    console.log(responseText);
	    $('.pop-outer').fadeOut('slow');
	     if(responseText=="Request Deleted Successfully"){
	     	$(".confirmbutton").prop('disabled', true);
	     	
	     	$('#successmsg').html("<div class='alert alert-success'>");
            $('#successmsg > .alert-success').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                    .append("</button>");
            $('#successmsg > .alert-success')
                    .append("<strong>"+responseText+". </strong>");
            $('#successmsg > .alert-success')
                    .append('</div>');
            
            $('.pop-alert-outer').fadeIn('slow');

	     }
	     else
	     	{    	
	    	 $('#successmsg').html("<div class='alert alert-danger'>");
             $('#successmsg > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                     .append("</button>");
             $('#successmsg > .alert-danger').append("<strong>"+responseText+". </strong>");
             $('#successmsg > .alert-danger').append('</div>'); 
             
             $('.pop-alert-outer').fadeIn('slow');
              	
	     	}
	     });
	 });
 </script>    

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
    },
    submitHandler : function(form) {
    	event.preventDefault();
		  var currentpass=$('#currentpassword').val();
       var newpass=$('#newpassword').val();
       var confirmpass=$('#confirmpassword').val();
       $('.pop-outer').fadeIn('slow');
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
          	 $('.pop-outer').fadeOut('slow');
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
    	return false;
    }
  });
 });
</script>
       <!-- Footer Start -->
	<%@include file="./html/footer.html"%>
	<!-- Footer End -->
	
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
    </body>
</html>
