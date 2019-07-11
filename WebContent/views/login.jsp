<%@ page import="controller.SessionController" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html lang="de">
<head>
    <meta charset="utf-8">
    <title>Login</title>
        <%@include file="../includes/head.jsp"%>
</head>
<body><p></p>
  <%SessionController.checkLogin(request, response);%>
<link href="/css/design.css" rel="stylesheet">
    <div id="header">
   <svg class="bg" viewBox="0 0 1000 55" preserveAspectRatio="none" width="100%" height="100%">
   <path d="M 0 35 Q 250 0 500 40 Q 750 65 1000 30 L 1000 55 L 000 55 " style="fill:#323ead" ></path>
   <path d="M 0 40 Q 250 15 500 40 Q 750 65 1000 40 L 1000 55 L 000 55 " style="fill:#192275" ></path>
</svg>
   <div class="logo-outer">
      <!--<div class="logo"></div>-->
     
   </div>

   </div>
<div id="nav">
   <div class="wrapper">
      <div class="name"><h1>Anmeldung</h1><br></div>
      
      <div class="space"></div>
    
      <div class="space"></div>
   </div>
</div>  


<div class="wrapper">
      <div class="row">
         <div class="col xs-col-100 m-col-50 l-col-33">




<div class="container">
    <div class="row justify-content-center">
        <div class="login col-sm-10 col-md-8 col-lg-6">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
            </div>
            <button class="btn btn-primary" id="submit_login">Login</button>
            <div class="invalid-feedback" id="invalid-login" style="display: none">
                Email or password wrong.
            </div>
            <hr>
            <p>Haven't got an account? <a href="/register">Register here</a></p>
        </div>
    </div>
</div>

 </div></div></div>




  <svg class="svg_1"  viewBox="0 0 1000 200" preserveAspectRatio="none" width="100%" height="100%">
   
      
      
      
          
      
      
      
</svg>

  
   
   
<div id="footer">
   <svg class="svg_1" viewBox="0 0 1000 80" preserveAspectRatio="none" width="100%" height="100%">
   
   <path d="M 0 40 Q 250 15 500 40 Q 750 65 1000 40 L 1000 0 L 000 0 " style="fill:#323ead" ></path>
         <path d="M 0 35 Q 250 0 500 40 Q 750 65 1000 30 L 1000 0 L 000 0 " style="fill:#192275" ></path>
</svg>


<div class="wrapper">&copy; 
      <a href="/views/design-Startseite.jsp"> Home  | </a>  

      
   <a href="/views/team.jsp" 
   title="mehr Informationen">The Social Network Team| </a>

   
   
   
     
    <a href="/views/impressum.jsp" 
   title="mehr Informationen">Impressum | </a>

   

     <a href="/views/Hilfeseite.jsp" 
   title="mehr Informationen"> Hilfe
</a> </div>
  
</div>
 
<script src="../js/scripts.js"></script>
<script src="../js/sha256.min.js"></script>
<script src="../js/login.js"></script>
</body>
</html>