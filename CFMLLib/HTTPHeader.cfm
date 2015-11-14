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
 Mimics the CFHEADER tag.
 
 @param name 	 Name used when passing name/value pairs. (Optional)
 @param value 	 Value used when passing name/value pairs. (Optional)
 @param statuscode 	 Status code used when passing statuscode/statustext pairs. (Optional)
 @param statustext 	 Status text used when passing statuscode/statustext pairs. (Optional)
 @return Returns nothing. 
 @author Kreig Zimmerman (kkz@foureyes.com) 
 @version 1, September 20, 2002 
--->
<cffunction name="HTTPHeader" output="false" returnType="void">
	<cfargument name="name" type="string" default="">
	<cfargument name="value" type="string" default="">
	<cfargument name="statuscode" type="string" default="">
	<cfargument name="statustext" type="string" default="">
	<cfif Len(name) and Len(value)>
		<cfheader name="#name#" value="#value#">
	<cfelseif Len(statuscode) and Len(statustext)>
		<cfheader statuscode="#statuscode#" statustext="#statustext#">
	</cfif>
</cffunction>