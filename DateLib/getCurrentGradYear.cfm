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
 Gets the current graduation year/end of school year.
 
 @param switchmonth 	 Numeric value for the first month of the school year. (Required)
 @return Returns a number. 
 @author Lisa D. Brown (wertle@wertle.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="getCurrentGradYear" returntype="numeric">
	<!---last month of a schoolyear--->
	<cfargument name="switchmonth" type="numeric" required="no" default="6">
	<cfset var currGradYear = -1>

	<!---if the current month is between January and the last month of the schoolyear, 
	set the current graduation year to the current year--->
	<cfif month(now()) gte 1 and month(now()) lte arguments.switchmonth>
		<cfset currGradYear = year(now())>
	<!---if the current month is between the first month of the schoolyear and December,
	 set the current graduation year to be next year--->
	<cfelseif month(now()) gt arguments.switchmonth and month(now()) lte 12>
		<cfset currGradYear = year(now()) + 1>
	</cfif>
	<cfreturn currGradYear>
</cffunction>