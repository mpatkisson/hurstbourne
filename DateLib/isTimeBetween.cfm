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
 Returns true/false if a time is between the supplied start/end times.
 v2 by Raymond Camden
 
 @param minTime 	 The lower range of time. (Required)
 @param maxTime 	 The upper range of time. (Required)
 @param time 	 The time to check. Defaults to now(). (Optional)
 @return Returns a boolean. 
 @author Anthony Galano (anthony@webpex.com) 
 @version 1, August 10, 2006 
--->
<cffunction name="isTimeBetween" access="public" returntype="boolean" output="false">
    <cfargument name="minTime" type="date" required="true">
    <cfargument name="maxTime" type="date" required="true">
	<cfargument name="time" type="date" required="false" default="#now()#">
	
    <cfset var curTime = createTime(timeFormat(arguments.time,"H"),timeFormat(arguments.time,"mm"),timeFormat(arguments.time,"ss"))>
    <cfif dateDiff("n",minTime,curTime) gt 0 and
          dateDiff("n",maxTime,curTime) lt 0>
        <cfreturn true>
    <cfelse>
        <cfreturn false>
    </cfif> 
       
</cffunction>