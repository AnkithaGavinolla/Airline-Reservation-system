<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>

	
<script type="text/javascript">
function changeTrip(){
	
	 if (document.getElementById('oneway').checked) {
	        document.getElementById('returnDate').style.display = 'none';
	        document.getElementById('returnDate1').style.display = 'none';
	    }
	    else {document.getElementById('returnDate').style.display = 'block';
	 document.getElementById('returnDate1').style.display = 'block';}
}

function changeFlight(){
	if (document.getElementById('domestic').checked) {
        document.getElementById('intSrcSelect').style.display = 'none';
        document.getElementById('intDesSelect').style.display = 'none';
        document.getElementById('srcSelect').style.display = 'block';
        document.getElementById('desSelect').style.display = 'block';
    }
    else {
    	document.getElementById('intSrcSelect').style.display = 'block';
    	document.getElementById('intDesSelect').style.display = 'block';
    	document.getElementById('srcSelect').style.display = 'none';
        document.getElementById('desSelect').style.display = 'none';
    }
}

function srcSelected(){
	document.getElementById('desSelect').style.display = 'block';
	document.getElementById('intDesSelect').style.display = 'none';
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/daterangepicker.min.css">
<script type="text/javascript" src="moment.min.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript" src="dist/jquery.daterangepicker.min.js"></script>
</head>

	<body>
	<%
try {
	String[] src1 ={"JFK","NEW","MUM","ABU"};
	//Create a connection string
	String url = "jdbc:mysql://cs539project.cizwcllfhawy.us-east-2.rds.amazonaws.com/Airlines";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "system", "12345678");
	
	//Create a SQL statement
	Statement stmt = con.createStatement();
	String str =  "SELECT * FROM Airport a"; 
	ResultSet result = stmt.executeQuery(str);
	
	Statement stmt1 = con.createStatement();
	String str1 =  "SELECT * FROM Airport a where country ='USA'"; 
	ResultSet result1 = stmt1.executeQuery(str1);
	
	%>
		<form method="post" action="dashboard.jsp">
		<table>
		
		<tr>
				<td><input type="radio" name="flightType" value="domestic" id="domestic" onchange="changeFlight()">Domestic</td>
				<td><input type="radio" name="flightType" value="international" id="international" onchange="changeFlight()">International</td>
			</tr>

			<tr>
				<td>Source</td>
				<td>Destination</td>
			</tr>

			<tr>
				<td><select name="source" id="intSrcSelect">
				
				<%
				while(result.next()) {
					String src = result.getString("name");%>
				<option value="<%=src%>"><%=src%></option>
				<%} %>
				</select></td>
				
				<td>
				
				
				<select name="destination" id="intDesSelect">
				<%
				str =  "SELECT * FROM Airport a"; 
				result = stmt.executeQuery(str);
				while(result.next()) {
					String src = result.getString("name");%>
				<option value="<%=src%>"><%=src%></option>
				<%} %>
				</select>
				</td>
				<td><select name="source" id="srcSelect" onchange="srcSelected()">
				
				<%
				while(result1.next()) {
					String src = result1.getString("name");%>
				<option value="<%=src%>"><%=src%></option>
				<%} %>
				</select></td>
				<td>
				<select name="destination" id="desSelect">
				<%str1 =  "SELECT * FROM Airport a where country ='USA'"; 
				result1 = stmt1.executeQuery(str1);
				while(result1.next()) {
					String src = result1.getString("name");%>
				<option value="<%=src%>"><%=src%></option>
				<%} %>
				</select>
				</td>
				
			</tr>

			<tr>
				<td><input type="radio" name="tripType" value="oneway" id="oneway" onchange="changeTrip()">One-Way</td>
				<td><input type="radio" name="tripType" value="round" id="round" onchange="changeTrip()">Round</td>
			</tr>

			<tr>
				<td>Departure Date</td>
				<td><input type="date" name="departureDate"></td>
				
				<td id="returnDate1">Return Date</td>
				<td><input type="date" name="returnDate" id="returnDate"></td>
				
			</tr>
			<tr>
				<td>Travel Class</td>
				<td><input type="radio" name="class" value="business">Business</td>
				<td><input type="radio" name="class" value="economy">Economy</td>
			</tr>
			<%session.setAttribute("JSPFile", "customer/viewFlights.jsp") ;%>
			<tr><td></td><td><input type="submit" value="Find Flights" >
		</table>
		</form>
		</body>
</html><%
con.close();
}
catch(Exception e){
	out.print(e.getMessage());
}
%>

