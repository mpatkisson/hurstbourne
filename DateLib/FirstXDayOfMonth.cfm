<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Returns a date object of the first occurance of a specified day in the given month and year.
 * 
 * @param day_number 	 An integer in the range 1 - 7. 1=Sun, 2=Mon, 3=Tue, 4=Wed, 5=Thu, 6=Fri, 7=Sat. (Required)
 * @param month_number 	 Month value.  (Required)
 * @param year 	 Year value. (Required)
 * @return Returns a date object. 
 * @author Troy Pullis (tpullis@yahoo.com) 
 * @version 1, March 23, 2005 
 */
function FirstXDayOfMonth(day_number,month_number,year) {
  var start_of_month = CreateDate(year,month_number,1);  // date object of first day for given month/year
  var daydiff = DayOfWeek(start_of_month) - day_number;
  var return_date = "";
  switch(daydiff) {
    case "-1": return_date = DateAdd("d",1,start_of_month); break;
    case "6": return_date = DateAdd("d",1,start_of_month); break;
    case "-2": return_date = DateAdd("d",2,start_of_month); break;
    case "5": return_date = DateAdd("d",2,start_of_month); break;
    case "-3": return_date = DateAdd("d",3,start_of_month); break;
    case "4": return_date = DateAdd("d",3,start_of_month); break;
    case "-4": return_date = DateAdd("d",4,start_of_month); break;
    case "3": return_date = DateAdd("d",4,start_of_month); break;
    case "-5": return_date = DateAdd("d",5,start_of_month); break;
    case "2": return_date = DateAdd("d",5,start_of_month); break;
    case "-6": return_date = DateAdd("d",6,start_of_month); break;
    case "1": return_date = DateAdd("d",6,start_of_month); break;
    default: return_date = start_of_month; break;  // daydiff=0, default to first day in current month
  } //end switch
  return return_date;
}
</cfscript>