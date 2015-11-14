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
 Allows for serialization to WDDX.
 Updated for CFMX var scope syntax.
 
 @param input 	 The value to serialize. (Required)
 @param useTimeZoneInfo 	 Indicates whether to output time-zone information when serializing CFML to WDDX. The default is yes. (Optional)
 @return Returns a WDDX packet. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, October 16, 2002 
--->
<cffunction name="wddxSerialize" output="false" returnType="string">
	<cfargument name="input" type="any" required="true">
	<cfargument name="useTimeZoneInfo" type="boolean" required="false" default="true">
	
	<cfset var output="">
	
	<cfwddx action="cfml2wddx" input="#input#" output="output" useTimeZoneInfo="#useTimeZoneInfo#">
	<cfreturn output>
</cffunction>