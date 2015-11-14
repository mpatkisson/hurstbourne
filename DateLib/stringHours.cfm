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
 Formats a number of minutes into into a nicely formatted string.
 
 @param mins 	 Numerical number of minutes. (Required)
 @return Returns a string. 
 @author Ryan Jeffords (rjeffords@me.com) 
 @version 1, November 26, 2010 
--->
<cffunction name="stringHours" returntype="string" output="false">
    <cfargument name="mins" type="numeric" required="true" />
    
    <cfset var retVal = "" />
	<cfset var rawHours = mins/60 />
	
	<!--- Calculate the hours --->
	<cfset var hours = int(rawhours) />	
    <cfif hours is "1">
		<cfset hours = hours & " hour " />
	<cfelse>
		<cfset hours = hours & " hours " />
    </cfif>
    
    <!--- Calculate the minutes --->
    <cfset mins = round((rawHours - int(rawHours)) * 60) />	
    <cfif mins is "1">
		<cfset mins = mins & " min " />
    <cfelse>
		<cfset mins = mins & " mins " />    
    </cfif>
    
    <!--- Add the hours --->
    <cfif left(hours, 1) IS NOT 0>
		<cfset retVal = hours />
    </cfif>
    
    <!--- Now bring them all together --->
    <cfif left(mins, 1) IS NOT 0>
		<cfset retVal = retVal & mins />
	</cfif>
    
    <cfreturn retVal />
</cffunction>