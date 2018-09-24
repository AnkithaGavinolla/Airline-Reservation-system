<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">

<head>
	<meta charset="utf-8"/>
	<title>Dashboard</title>
	
	<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen" />
	
	<script src="js/hideshow.js" type="text/javascript"></script>
	<script src="js/jquery.tablesorter.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery.equalHeight.js"></script>
	<script type="text/javascript">
	$(document).ready(function() 
    	{ 
      	  $(".tablesorter").tablesorter(); 
   	 } 
	);
	$(document).ready(function() {

	//When page loads...
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content

	//On Click Event
	$("ul.tabs li").click(function() {

		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content

		var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active ID content
		return false;
	});

});
    </script>
    <script type="text/javascript">
    $(function(){
        $('.column').equalHeight();
    });
</script>

</head>
<%
String uname=session.getAttribute("user_name").toString();%>

<body>

		<hr/>
	<%if(uname.equalsIgnoreCase("manager")){ %>
	<h3>Manager</h3>
		<ul class="toggle">
	
			<li class="icn_settings"><a href="manager/viewUsers.jsp">View Users</a></li>
			<li class="icn_jump_back"><a href="manager/viewFlight.jsp">View Flights</a></li>
			<li class="icn_jump_back"><a href="manager/addUser.jsp">Month wise Sales Report</a></li>
			<li class="icn_jump_back"><a href="manager/addUser.jsp">View Reservations</a></li>
			<li class="icn_jump_back"><a href="manager/addUser.jsp">Revenue Report</a></li>
			<li class="icn_jump_back"><a href="manager/addUser.jsp">Current Status of airlines</a></li>
			
		</ul>
	<%}else{ %>
		<h3>Customers</h3>
		<ul class="toggle">
			<li class="icn_add_user"><a href="customer/bookFlight.jsp">Book Flight</a></li>
			<li class="icn_view_users"><a href="customer/viewHistory.jsp">View History</a></li>
			
		</ul>
<h3><%} %>


	</h3>
</body>

</html>
