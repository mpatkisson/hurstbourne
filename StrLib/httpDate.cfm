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
 Format a date as required by HTTP specifications
 
 @param theDate 	 A date to format. Defaults to Now(). (Optional)
 @return Returns a string. 
 @author Massimo Foti (massimo@massimocorner.com) 
 @version 1, January 2, 2004 
--->
<cffunction name="httpDate" output="true" returntype="numeric" hint="Format a date as required by HTTP specifications">
	<cfargument name="theDate" type="date" required="false" default="#Now()#" hint="Date to format, default to Now()">
	<cfset var returnDate="#DateFormat(arguments.theDate, 'ddd, dd mmm yyyy')# #TimeFormat(arguments.theDate, 'HH:mm:ss')# GMT">
	<cfreturn returnDate>
</cffunction>