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
 Obtains current time data from NIST Internet Time Service servers.
 
 @param timeServer 	 Time server. Defaults to 192.43.244.18. (Optional)
 @return Returns a structure. 
 @author Ben Forta (ben@forta.com) 
 @version 1, December 7, 2005 
--->
<cffunction name="GetNISTTime" returntype="struct" output="false">
	<cfargument name="timeServer" type="string" default="192.43.244.18" required="false">
	<cfset var result=StructNew()>

	<!--- Try/catch block --->
	<cftry>

      <!--- Try get time data --->
      <cfhttp url="http://#arguments.timeServer#:13/" />
      <!--- Save raw data --->
      <cfset result.raw = CFHTTP.FileContent>
      <!--- Extract Julian date --->
      <cfset result.julian=ListGetAt(result.raw, 1, " ")>
      <!--- Extract current date and time --->
      <cfset result.now=ParseDateTime(ListGetAt(result.raw, 2, " ")
                              & " "
                              & ListGetAt(result.raw, 3, " "))>
      <!--- Extract daylight savings time flag --->
      <cfset result.dst=IIf(ListGetAt(result.raw, 4, " ") IS 0,
                        FALSE, TRUE)>
      <!--- Extract leap month flag --->
      <cfset result.leapmonth=IIf(ListGetAt(result.raw, 5, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract health flag --->
      <cfset result.healthy=IIf(ListGetAt(result.raw, 6, " ") IS 0,
                           FALSE, TRUE)>
      <!--- Extract advance milliseconds --->
      <cfset result.msadv=ListGetAt(result.raw, 7, " ")>
      <!--- Success --->
      <cfset result.success=TRUE>

      <!--- Catch any errors --->
      <cfcatch type="any">
         <cfset result.success=FALSE>
      </cfcatch>

	</cftry>

	<cfreturn result>

</cffunction>