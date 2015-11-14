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
 * Returns the date for Inauguration Day
 * Minor modifications by Rob Brooks-Bilson
 * 
 * @param TheYear 	 The year you want to return Inauguration Day for. 
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, August 28, 2001 
 */
//Inauguration Day: Jan 20, every 4 years ,2001,2005 etc. If Jan 20 is Sunday, InaugurationDay is Jan 21
// for other  years, -1 is returned
function GetInaugurationDay() 
{
  Var TheYear=Year(Now());
  if(ArrayLen(Arguments)) 
    TheYear = Arguments[1];
  if(TheYear MOD 4 eq 1){ 
    if(DayOfWeek(CreateDate(TheYear,1,20)) eq 1){  //Sunday
      return CreateDate(TheYear,1,21);
    }
    else{
      return CreateDate(TheYear,1,20);
    }
  } 
  else{
    return -1;
  }
}
</cfscript>