<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.ParseException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Book Flights</title>
</head>
<body>
customer flights

<%
try {
	
	
	String source = request.getParameter("source");
	String destination = request.getParameter("destination");
	String departureDate = request.getParameter("departureDate");
	String returnDate = request.getParameter("returnDate");
	String tripType = request.getParameter("tripType");
	String class1 = request.getParameter("class");
	
	
	//date calculations
	
	Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(departureDate);  
	
	Calendar cal = Calendar.getInstance();
	cal.setTime(date1); // sets calendar time/date
    int dayOfBooking = cal.get(Calendar.DAY_OF_WEEK);
  
	String[] src1 ={"JFK","NEW","MUM","ABU"};
	//Create a connection string
	String url = "jdbc:mysql://cs539project.cizwcllfhawy.us-east-2.rds.amazonaws.com/Airlines";
	//Load JDBC driver - the interface standardizing the connection procedure. Look at WEB-INF\lib for a mysql connector jar file, otherwise it fails.
	Class.forName("com.mysql.jdbc.Driver");

	//Create a connection to your DB
	Connection con = DriverManager.getConnection(url, "system", "12345678");
	
	//Create a SQL statement
	
	String srcid = null;
	String desid = null;
	
	Statement stmt1 = con.createStatement();
	String str1 =  "SELECT id as src FROM Airport a where name ='"+source+"'"; 
	ResultSet result1 = stmt1.executeQuery(str1);
	
	if(result1.next())
	{
		srcid = result1.getString("src");
	}
	
	
	Statement stmt2 = con.createStatement();
	String str2 =  "SELECT id as des FROM Airport a where name ='"+destination+"'"; 
	ResultSet result2 = stmt1.executeQuery(str2);
	
	if(result2.next())
	{
		desid = result2.getString("des");
	}
	
	Statement stmt = con.createStatement();
	String str = "SELECT * FROM route WHERE sourceid='" + srcid + "' and destinationid = '"+desid+"'";
	ResultSet result = stmt.executeQuery(str);
	
	Statement stmt3 = con.createStatement();
	String str3 = "select "+
			"temp.airlineid srcAirline, "+
			"temp.flightno srcFlightNo, "+
			"temp.sourceid srcAirport, "+
			"temp.destinationid intAirport, "+
			"temp.departuretime depart, "+
			"temp.arrivaltime intArrive, "+
			"r3.flightno desFlightNo, "+
			"r3.destinationid desAirport, "+
			"r3.departuretime intDepart, "+
			"r3.arrivaltime arrive "+
			"from (SELECT r1.* FROM route r1 "+ 
			"where r1.sourceid='"+srcid+"') temp "+
			"inner join route r3 on temp.destinationid = r3.sourceid "+ 
			"where r3.destinationid = '"+desid+"' "+
			"and temp.airlineid = r3.airlineid;";
	ResultSet result3 = stmt3.executeQuery(str3);
	
	StringBuilder sb = new StringBuilder();
	while(result3.next())
	{
		int srcFlightNo = Integer.parseInt(result3.getString("srcFlightNo"));
		sb.append(result3.getString("srcAirport"));
		sb.append("--");
		sb.append(result3.getString("intAirport"));
		sb.append("--");
		sb.append(result3.getString("desAirport"));
		sb.append("--");
		sb.append(System.lineSeparator());
		
	}
	%>
	
	 source = <%=source%><br>
	destination = <%=destination%><br>
	departureDate = <%=departureDate%><br>
	 returnDate = <%=returnDate%><br>
	 tripType = <%=tripType %><br>
	 class = <%=class1%><br>
	 
	 Final answer = <%=sb %>
	
	
</body>
</html>
<%
con.close();
}
catch(Exception e){
	out.print(e.getMessage());
}
%>