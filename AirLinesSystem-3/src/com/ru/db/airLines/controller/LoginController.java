package com.ru.db.airLines.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HomeController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		Calendar cal = Calendar.getInstance();
				cal.setTime(new Date());
				System.out.println(cal.get(Calendar.DAY_OF_WEEK));
				
				cal = Calendar.getInstance();
				cal.setTime(new Date());
				
				
				cal = Calendar.getInstance(); // creates calendar
			    cal.setTime(new Date()); // sets calendar time/date
			    System.out.println(cal.get(Calendar.DAY_OF_WEEK));
			    cal.add(Calendar.HOUR_OF_DAY, -24); // adds one hour
			    System.out.println(cal.getTime().compareTo(Calendar.getInstance().getTime()));
			    System.out.println(cal.getTime());
			    String str ="1234";
			    str.concat(Integer.toString(2));	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String sDate1="31/12/1998";  
	    String sDate2 = "31-Dec-1998";  
	    String sDate3 = "12 31, 1998";  
	    String sDate4 = "Thu, Dec 31 1998";  
	    String sDate5 = "Thu, Dec 31 1998 23:37:50";  
	    String sDate6 = "31-Dec-1998 23:37:50";  
	    SimpleDateFormat formatter1=new SimpleDateFormat("dd/MM/yyyy"); 
	    SimpleDateFormat formatter2=new SimpleDateFormat("dd-MMM-yyyy");  
	    SimpleDateFormat formatter3=new SimpleDateFormat("MM dd, yyyy");  
	    SimpleDateFormat formatter4=new SimpleDateFormat("E, MMM dd yyyy");  
	    SimpleDateFormat formatter5=new SimpleDateFormat("E, MMM dd yyyy HH:mm:ss");  
	    SimpleDateFormat formatter6=new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");  
	    try {
	    Date date1=formatter1.parse(sDate1);  
	    Date date2=formatter2.parse(sDate2);  
	    Date date3=formatter3.parse(sDate3);  
	    Date date4;
		
			date4 = formatter4.parse(sDate4);
		
	    Date date5=formatter5.parse(sDate5);  
	    Date date6=formatter6.parse(sDate6);  
	    System.out.println(sDate1+"\t"+date1);  
	    System.out.println(sDate2+"\t"+date2);  
	    System.out.println(sDate3+"\t"+date3);  
	    System.out.println(sDate4+"\t"+date4);  
	    System.out.println(sDate5+"\t"+date5);  
	    System.out.println(sDate6+"\t"+date6); 
	    } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}

}
