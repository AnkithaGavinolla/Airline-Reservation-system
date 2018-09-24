
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- CSS Included Here -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
</head>
<%
	String Uname=(String)request.getAttribute("UID");
	
%>
<body>
<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a><span>Airlines Reservation System</span>
				
	
		
	
		</ul>
	
			
				<!-- user dropdown starts -->
				<div class="btn-group pull-right" >
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"><%=Uname %></span>
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
					<%-- <%if(!Uname.equalsIgnoreCase("manager")){ %> --%>
						<li><a href="/HRModule/profile">Profile</a></li>
						<li class="divider"></li>
						<%-- <%} %> --%>
						<li><a href="/HRModule/homepage">Home Page</a></li>
						<li class="divider"></li>
						<li><a href="/HRModule/LogoutCheck">Logout</a></li>
					</ul>
					
				</div>
				
				
			</div>
		</div>
	</div>
<!-- topbar ends -->
		<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
</body>
</html>
