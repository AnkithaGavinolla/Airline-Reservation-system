<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
		.content {
		  background-color: #FFFFFF;
		 background-image: url(images/login.jpg);
		  color: #000;
		  height: 520px;
		  width: 690px;
		}
		.container {margin-top:5em;}
		.logout_container {margin-top:5em;}
		.content label {color:#23415A;font-weight:bold;}
		.buttons input[type=submit]
		{
		  background-color:#17375E;
		  color:#FFFFFF;
		  font-size:13px;
		  border: 1px outset #ccc;
		}
		.buttons input[type=submit]:hover
		{
		  background-color:#E5F0FF;
		  color:black;
		  cursor:pointer;
		  border:1px solid #17375E;
		}
		.form .register-form {
  			display: none;
		}
	</style>
</head>
<!-- link rel="stylesheet" type="text/css" href="css/login.css"-->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airlines Reservation System</title>

</head>
<body>

<%
session.setAttribute("user_name", "");
session.setAttribute("user_email", "");
%>

<p class="app-name"> Airlines Reservation System </p>      

<div class="login-page">
  <div class="form">
    <form class="register-form" method="post" action="newUser.jsp">
      <table>
      <tr>
      <td></td>
      <td></td>
      </tr>
      <tr><td></td></tr>
      <tr><td></td></tr>
      
      </table>
      <input type="text" placeholder="first name" name="fname"/>
      <input type="text" placeholder="last name" name="lname"/>
      <input type="email" placeholder="email" name="email"/>
      <input type="text" placeholder="address" name="address"/>
      <input type="text" placeholder="city" name="city"/>
      <input type="text" placeholder="zipcode" name="zip" maxlength="7"/>
      <input type="tel" placeholder="telephone" name="telephone"/>
      <input type="number" placeholder="creditCard" name="creditcard" maxlength="16" required="required"/><span style="color: red">*</span>
      <input type="password" placeholder="password" name="password"/>
      
      
      
      <button>create</button>
      
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    
    <form class="login-form" method="post" action="checkUser.jsp">
      <input type="email" placeholder="email" name="email"/>
      <input type="password" placeholder="password" name="password"/>
      <button>login</button>
      <p class="message">Not registered? <a href="#">Create an account</a></p>
      <p class="message"><a href="manager/managerLogin.jsp">Manager Login</a></p>
      
    </form>
     
  </div>
</div>

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script type="text/javascript">
$(document).ready(function(){
	if (window.location.href.indexOf('signup')!=-1){
		$('.login-form').hide();
		$('.register-form').show();
	}
});

 $('.message a').click(function(){
	   $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
	}); 
</script>

</body>
</html>