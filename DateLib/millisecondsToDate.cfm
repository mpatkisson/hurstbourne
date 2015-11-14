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
 Converts epoch milleseconds to a date timestamp.
 
 @param strMilliseconds 	 The number of milliseconds. (Required)
 @return Returns a date. 
 @author Steve Parks (steve@adeptdeveloper.com) 
 @version 1, May 20, 2005 
--->
<cffunction name="millisecondsToDate" access="public" output="false" returnType="date">
	<cfargument name="strMilliseconds" type="string" required="true">
	
	<cfreturn dateAdd("s", strMilliseconds/1000, "january 1 1970 00:00:00")>
</cffunction>