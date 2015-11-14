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
 leftDotDot turns &quot;This is a nice day&quot; into &quot;This is a nic..&quot;
 
 @param str 	 String to use (Required)
 @param l 	 length to use (Optional)
 @return Returns a string 
 @author Peter Coppinger (peter@digital-crew.com) 
 @version 0, May 9, 2009 
--->
<cffunction name="leftDotDot" output="no" returntype="string">
	<cfargument name="str" type="string" required="yes">
	<cfargument name="l" type="numeric" required="no" default="80">
	
	<cfset var result = str>
	
	<cfif Len( str ) GT l>
		<cfset result = Left( Trim(str), l-2 ) & "...">
	</cfif>
	
	<cfreturn result>
	
</cffunction>