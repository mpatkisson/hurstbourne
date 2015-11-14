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

<!---
 This is the opposite of CFs DayOfYear function.
 v2 bug fix by David Levin (dave@angrysam.com)
 v3 fix by Christopher Jordan
 
 @param currentDayOfYear 	 Numerical day of the year. (Required)
 @param currentYear 	 The year. Defaults to this year. (Optional)
 @return Returns a date. 
 @author Jeff Houser (jeff@farcryfly.com) 
 @version 3, September 7, 2007 
--->
<cffunction name="dayOfYearReverse" returntype="date" hint="Accepts the day of Year (Integer) and year in question, and returns the date" output="false">
        <cfargument name="currentDayOfYear" type="numeric" required="yes">
        <cfargument name="currentYear" type="numeric" default="#year(now())#" required="no">
        <cfreturn dateAdd("d",arguments.currentDayOfYear, createDate(arguments.currentyear-1,"12","31" ))>
</cffunction>