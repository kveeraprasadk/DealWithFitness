<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<%@page import="main.model.TrainerDetailsVO" %>
<%@ page isELIgnored="false" %>
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

    <body onLoad="LoadingInvestorsData()">
    <script type="text/javascript">
     function LoadingInvestorsData(){
    	 $.ajax({
    		 type: 'GET',
    		 url: "${pageContext.request.contextPath}/TrainersListServlet",
    		 
    	 });
    	 
     }
      </script>
      <script type="text/javascript">
      $(document).ready(function () {
    	     	  
    	  $("select").change(function () {
    		  
    		  event.preventDefault();
    		  var exp=$('#form-expertise').val();
    		  alert(exp);
    		  $.ajax({
                  url: "TrainersListOptionalServlet",
                  type: "Get",
                  data: {
                	  expertise : exp
                  	
                  },
                  cache: false,
                  success: function (data) {
                	  console.log(data);
                   	  
                   		 
                   		  document.location.href='./expertiselist?expertise='+exp;
                         	                 
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
                               <a href="index.jsp" class="nav-item nav-link ">Home</a>
                        <a href="About.jsp" class="nav-item nav-link">About</a>             
                        <a href="./Trainers" class="nav-item nav-link active" >Class</a>       
                         
                        
                       
                       <a href="Trainer.jsp" class="nav-item nav-link">Trainer</a>
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
                        <a href="index.jsp">Home</a>
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
                                 <div class="class-meta">
                        
                                    <p><button class="btn btn-danger bookbutton" value="<%=trainerdetails.getName() %>,<%=trainerdetails.getEmail() %>,<%=trainerdetails.getExpertise() %>,<%=trainerdetails.getClasslevel() %>,<%=trainerdetails.getSchedule() %>,<%=trainerdetails.getMonthlyfees() %>" data-toggle="modal" data-target="#myModal">Book</button></p>
                                    <%if(trainerdetails.getDemo1().equals("Yes")) {%>
                                    <p><button class="btn btn-info profiledata" value="<%=trainerdetails.getEmail() %>">Demo</button></p>
                                    <%}else{ %>
                                    <p><button class="btn btn-info" disabled="disabled">Demo</button></p>
                                    <%} %>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <% if(trainerdetails.getExpertise2().length() > 5){ %>
                    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="class-wrap">
                           <div class="class-img"> 
                               <h2><%=trainerdetails.getExpertise2() %></h2><br>
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
                                <h2><%=trainerdetails.getClasslevel2() %></h2>
                                
                               
                                <div class="class-meta">
                          <!--           <p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>   -->
                                    <p><i class="far fa-clock"></i><%=trainerdetails.getSchedule2() %></p><br>
                                  
                                   
                                </div>
                                 <div class="class-meta">
                        
                                   <p> <Strong>Fees : <i class="fa fa-inr"> </i><%=trainerdetails.getMonthlyfees2() %></Strong></p>
                                   
                                </div>
                                 <div class="class-meta">
                        			
                                    <p><button class="btn btn-danger bookbutton" value="<%=trainerdetails.getName() %>,<%=trainerdetails.getEmail() %>,<%=trainerdetails.getExpertise2() %>,<%=trainerdetails.getClasslevel2() %>,<%=trainerdetails.getSchedule2() %>,<%=trainerdetails.getMonthlyfees2() %>" data-toggle="modal" data-target="#myModal">Book</button></p>
                                    <%if(trainerdetails.getDemo2().equals("Yes")) {%>
                                    <p><button class="btn btn-info profiledata" value="<%=trainerdetails.getEmail() %>">Demo</button></p>
                                    <%}else{ %>
                                    <p><button class="btn btn-info" disabled="disabled">Demo</button></p>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    
                    
                    
                    
                   <% if(trainerdetails.getExpertise3().length() > 5){ %>
                    <div class="col-lg-4 col-md-6 col-sm-12 class-item filter-1 wow fadeInUp" data-wow-delay="0.0s">
                        <div class="class-wrap">
                           <div class="class-img"> 
                               <h2><%=trainerdetails.getExpertise3() %></h2><br>
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
                                <h2><%=trainerdetails.getClasslevel3() %></h2>
                                
                               
                                <div class="class-meta">
                          <!--           <p><i class="far fa-calendar-alt"></i>Sun, Tue, Thu</p>   -->
                                    <p><i class="far fa-clock"></i><%=trainerdetails.getSchedule3() %></p><br>
                                  
                                   
                                </div>
                                 <div class="class-meta">
                        
                                   <p> <Strong>Fees : <i class="fa fa-inr"> </i><%=trainerdetails.getMonthlyfees3() %></Strong></p>
                                   
                                </div>
                                 <div class="class-meta">
                        
                                    <p><button class="btn btn-danger bookbutton" value="<%=trainerdetails.getName() %>,<%=trainerdetails.getEmail() %>,<%=trainerdetails.getExpertise3() %>,<%=trainerdetails.getClasslevel3() %>,<%=trainerdetails.getSchedule3() %>,<%=trainerdetails.getMonthlyfees3() %>" data-toggle="modal" data-target="#myModal">Book</button></p>
                                    <%if(trainerdetails.getDemo3().equals("Yes")) {%>
                                    <p><button class="btn btn-info profiledata" value="<%=trainerdetails.getEmail() %>">Demo</button></p>
                                    <%}else{ %>
                                     <p><button class="btn btn-info" disabled="disabled">Demo</button></p>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    
                    
                    <%
							}
						}
					%>       
                    
                </div>
            </div>
        </div>
        <!-- Class End -->
        
       <script>
            $(document).on("click", ".profiledata", function() { // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
            	
            	var useremail=$(this).val();
        		
                $.get("TrainerDetailsView",{trainersemail: useremail}, function(responseText) {   // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response text...
                	console.log(responseText);
                	var globalarray = [];
                    globalarray.push(responseText);
                     window.localStorage.setItem("globalarray", JSON.stringify(globalarray));
                document.location.href='./trainerdetails.jsp';
                
                  });
            });
        </script> 
        
        
        <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title text-center">Trainee Register</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body text-center">
          <p><input type="email" name="traineeemailid" id="traineeemailid" class="formcontrol" placeholder="Trainee Email.."></p>
          <p><input type="number" name="traineephone" id="traineephone" class="formcontrol" placeholder="Trainee PhoneNumber.."></p>
          <p><input type="password" name="traineepassword" id="traineepassword" class="formcontrol" placeholder="Trainee Password..">
          </p>
          <p><button type="button" class="btn btn-primary" id="traineeregbutton">Register</button>
          <button type="button" class="btn btn-primary" id="traineeloginbutton">Login</button></p>
                 
        </div>
        <div class="modal-footer">
        <p><label id="labelloginbutton">Already Register, Plz <button id="labelloginbutton" name="labelloginbutton">Login!</button></label>
        <label id="labelcancel"><button id="labelcancelbutton" name="labelcancelbutton">Cancel</button></label></p>
          <div id="tsuccess"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal End -->
  <script type="text/javascript">
      $(document).ready(function () {
    	  $('#labelcancelbutton').hide();
    	  $('#traineeloginbutton').hide();    	 
    	  $('#labelloginbutton').click(function(){
    		  $('#labelcancelbutton').show();
        	  $('#traineeloginbutton').show();        	 
        	  $('#traineephone').hide();
        	  $('#traineeregbutton').hide();
        	  $('#labelloginbutton').hide();
    	  });
    	  $('#labelcancelbutton').click(function(){
    		  $('#labelcancelbutton').hide();
        	  $('#traineeloginbutton').hide();     	 
        	  $('#traineephone').show();
        	  $('#traineeregbutton').show();
        	  $('#labelloginbutton').show();
    	  });
    	  
      });
      </script>
<script type="text/javascript">
      $(document).ready(function () {
    	     	  var trainerdetails,trainername,traineremail,trainerexpertise,trainerclasslevel,trainerschedule,trainermonthlyfees;
    	     	 $('.bookbutton').click(function(){
    	     		 trainerdetails=$(this).val();
    	     		 
    	     		
    	     	 });
    	  $('#traineeregbutton').click(function(){
    		  
    		  event.preventDefault();
    		  var countryArray = trainerdetails.split(',');

    	        for (var i = 0; i < countryArray.length; i++) {
    	          if(i==0){
    	        	  var trainername=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	          if(i==1){
    	        	  var traineremail=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	          if(i==2){
    	        	  var trainerexpertise=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	          if(i==3){
    	        	  var trainerclasslevel=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	          if(i==4){
    	        	  var trainerschedule=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	          if(i==5){
    	        	  var trainermonthlyfees=countryArray[i];
    	        	  alert(countryArray[i]);
    	          }
    	        }
    		  var mailid=$('#traineeemailid').val();
    		 var phone=$('#traineephone').val();
    		 var pass=$('#traineepassword').val();
    		 
    		  $.ajax({
                  url: "TraineeClassRegisterPayment",
                  type: "Post",
                  data: {
                	  email : mailid,
                	  phoneno : phone,
                	  password : pass
                  	
                  },
                  cache: false,
                  success: function (data) {
                	  console.log(data);
                   	  
                   		 if(data == "Trainee Register successfull"){
                   			var globaltrainee = [];
                   			globaltrainee.push(trainername);
                   			globaltrainee.push(traineremail);
                   			globaltrainee.push(trainerexpertise);
                   			globaltrainee.push(trainerclasslevel);
                   			globaltrainee.push(trainerschedule);
                   			globaltrainee.push(trainermonthlyfees);
                   			
                             window.localStorage.setItem("globaltrainee", JSON.stringify(globaltrainee));
                    
                   		  document.location.href='./TraineeClassBooking.jsp';
                   		  
                   		 }else{
                   			$('#tsuccess').html("<div class='alert alert-danger'>");
                            $('#tsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                    .append("</button>");
                            $('#tsuccess > .alert-danger').append($("<strong>").text( data));
                            $('#tsuccess > .alert-danger').append('</div>'); 
                   		 }                         	                 
                         },
                     error: function (data) {
                    	 
                         $('#tsuccess').html("<div class='alert alert-danger'>");
                         $('#tsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                 .append("</button>");
                         $('#tsuccess > .alert-danger').append($("<strong>").text( data));
                         $('#tsuccess > .alert-danger').append('</div>');
                         
                     }
    		  });
    	  });
$('#traineeloginbutton').click(function(){
	event.preventDefault();
	  var countryArray = trainerdetails.split(',');

      for (var i = 0; i < countryArray.length; i++) {
        if(i==0){
      	  var trainername=countryArray[i];
      	  alert(countryArray[i]);
        }
        if(i==1){
      	  var traineremail=countryArray[i];
      	  alert(countryArray[i]);
        }
        if(i==2){
      	  var trainerexpertise=countryArray[i];
      	  alert(countryArray[i]);
        }
        if(i==3){
      	  var trainerclasslevel=countryArray[i];
      	  alert(countryArray[i]);
        }
        if(i==4){
      	  var trainerschedule=countryArray[i];
      	  alert(countryArray[i]);
        }
        if(i==5){
      	  var trainermonthlyfees=countryArray[i];
      	  alert(countryArray[i]);
        }
      }
    		 
    		  var mailid=$('#traineeemailid').val();    		
    		 var pass=$('#traineepassword').val();
    		 
    		  $.ajax({
                  url: "TraineeClassLoginPayment",
                  type: "Get",
                  data: {
                	  email : mailid,                	 
                	  password : pass
                  	
                  },
                  cache: false,
                  success: function (data) {
                	  console.log(data);
                   	  
                   		 if(data == "Login Success"){
                   			var globaltrainee = [];
                   			globaltrainee.push(trainername);
                   			globaltrainee.push(traineremail);
                   			globaltrainee.push(trainerexpertise);
                   			globaltrainee.push(trainerclasslevel);
                   			globaltrainee.push(trainerschedule);
                   			globaltrainee.push(trainermonthlyfees);
                   			
                            window.localStorage.setItem("globaltrainee", JSON.stringify(globaltrainee));
                    
                   		  document.location.href='./TraineeClassBooking.jsp';
                   		 }else{
                   			$('#tsuccess').html("<div class='alert alert-danger'>");
                            $('#tsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                    .append("</button>");
                            $('#tsuccess > .alert-danger').append($("<strong>").text( data));
                            $('#tsuccess > .alert-danger').append('</div>'); 
                   		 }                         	                 
                         },
                     error: function (data) {
                    	 
                         $('#tsuccess').html("<div class='alert alert-danger'>");
                         $('#tsuccess > .alert-danger').html("<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;")
                                 .append("</button>");
                         $('#tsuccess > .alert-danger').append($("<strong>").text( data));
                         $('#tsuccess > .alert-danger').append('</div>');
                         
                     }
    		  });
    	  });
    	  
      });
      </script>
      
      
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
    </body>
</html>
