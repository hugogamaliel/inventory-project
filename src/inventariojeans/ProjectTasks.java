package inventariojeans;

import java.util.Calendar;
import java.util.Date;

public class ProjectTasks 
{

	public String turnDateTOSQLFormat(Date today)
	{
		String fechaResp = "";
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(today);
		
		System.out.println("Hoy: " + today);
		int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONTH);
	    int day = cal.get(Calendar.DAY_OF_MONTH);
	    
	    month = month + 1;
	    
	    String sMonth = "";
	    
	    if (month <= 9)
	    	sMonth = "0" + month;
	    else
	    	sMonth = Integer.toString(month);
	    
	    month = month + 1;
	    fechaResp = day + "-" + sMonth + "-" + year;
	    System.out.println("Clase ProjectTasks (Fecha: " + fechaResp + ")");
		return fechaResp;
	}
	
	public String turnDateToFriendlyFormat(Date today)
	{
		String fechaResp = "";
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(today);
		
		System.out.println("Hoy: " + today);
		int year = cal.get(Calendar.YEAR);
	    int month = cal.get(Calendar.MONTH);
	    int day = cal.get(Calendar.DAY_OF_MONTH);
	    
	    month = month + 1;
	    
	    String sMonth = "";
	    String sDay = "";
	    
	    //Month
	    if (month <= 9)
	    	sMonth = "0" + month;
	    else
	    	sMonth = Integer.toString(month);
	    
	    //Day
	    if (day <= 9)
	    	sDay = "0" + day;
	    else
	    	sDay = Integer.toString(day);
	    
	    month = month + 1;
	    fechaResp = sDay + "-" + sMonth + "-" + year;
	    System.out.println("Clase ProjectTasks (Fecha: " + fechaResp + ")");
		return fechaResp;
	}
}
