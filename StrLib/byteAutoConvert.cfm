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
 Converts Byte values to the shortest human-readable format
 03-mar-2010 minor change to the way units variable was created
 
 @param bytes 	 size in bytes to format (Required)
 @param maxreduction 	 limit on reduction (Optional)
 @return returns a string 
 @author Joerg Zimmer (joerg@zimmer-se.de) 
 @version 0, March 3, 2010 
--->
<cffunction name="byteAutoConvert" access="public" returntype="string" output="false">
	<cfargument name="bytes" type="numeric" required="true">
	<cfargument name="maxreduction" type="numeric" required="false" default="9">
	<cfset var units = listToArray("B,KB,MB,GB,TB,PB,EB,ZB,YB",",")>> 
	<cfset var conv = 0>
	<cfset var exp = 0>
	
	<cfif arguments.maxreduction gte 9>
		<cfset arguments.maxreduction = arraylen(units) - 1>
	</cfif>
	
	<cfif arguments.bytes gt 0>
		<cfset exp = fix(log(arguments.bytes) / log(1024))>
		<cfif exp gt arguments.maxreduction>
			<cfset exp = arguments.maxreduction>
		</cfif>
		<cfset conv = arguments.bytes / (1024^exp)>
	</cfif>
			
	<cfreturn "#trim(lsnumberformat(conv,"_____.00"))# #units[exp + 1]#"/>
</cffunction>