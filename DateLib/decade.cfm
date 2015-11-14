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
 Returns the decade (xxx0-xxx9) to which the specified year belongs.
 
 @param year 	 Year to use (Required)
 @return Returns a string 
 @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 @version 1, July 27, 2012 
--->
<cffunction name="decade" returntype="string" output="no">
	<cfargument name="year" type="numeric" required="yes">

	<cfset var startYear = arguments.year - (arguments.year MOD 10)>
	<cfset var endYear = arguments.year + (10 - (arguments.year MOD 10) - 1)>

	<cfreturn startYear & "-" & endYear>
</cffunction>