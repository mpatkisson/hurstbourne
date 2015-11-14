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
 Mimics the CFFLUSH tag and sends all content to the screen.
 Version 2 by RCamden (ray@camdenfamily.com)
 
 @param interval 	 Flushes output each time this number of bytes becomes available. (Required)
 @return Returns nothing. 
 @author Eric C. Davis (cflib@10mar2001.com) 
 @version 2, April 22, 2003 
--->
<cffunction name="flush" returnType="void">
	<cfargument name="interval"  type="numeric" required="false">
	<cfif isDefined("interval")>
		<cfflush interval="#interval#">
	<cfelse>
		<cfflush>
	</cfif>
</cffunction>