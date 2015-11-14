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
 Returns the date for Orthodox Easter (Pascha) in a given year.
 
 @param y 	 Year. Defaults to the current year. (Optional)
 @return Returns a date. 
 @author John E Pusey (nightgazing@gmail.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="getPascha" returntype="date">
	<cfargument name="y" type="numeric" required="false" default="#year(now())#">
	
	<cfset var t = 0>
	<cfset var dd = 0>
	<cfset var mm = 0>
	
	<cfset t = (19 * (y mod 19) + 16) mod 30>
	<cfset dd = 3 + t + (2 * (y mod 4) + 4 * (y mod 7) + 6 * t) mod 7>

	<cfif y lt 1924>
		<cfset dd = dd - 13>
	</cfif>

	<cfif dd gt 30>
		<cfset dd = dd - 30>
		<cfset mm = 5>
	<cfelse>
		<cfset mm = 4>
	</cfif>
	
	<cfif dd lt 1>
		<cfset dd = dd + 31>
		<cfset mm = 3>
	</cfif>

  <cfreturn createDate(y, mm, dd)>
</cffunction>