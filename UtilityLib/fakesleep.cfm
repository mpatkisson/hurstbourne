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
 Causes the current page request to &quot;sleep&quot; for the given duration, before continuing.
 
 @param timeToSleep 	 Number of miliseconds to sleep. (Required)
 @return Returns nothing. 
 @author Nolan Erck (nolan.erck@gmail.com) 
 @version 1, April 11, 2008 
--->
<cffunction name="fakesleep" access="public" returntype="void" output="false">
	<cfargument name="timeToSleep" type="numeric" required="true" hint="the number of miliseconds you wish to sleep for." />

	<cfset var bContinue 	= false />	
	<cfset var startTime 	= getTickCount() />
	<cfset var endTime 		= 0 />
	<cfset var elapsedTime  = 0 />

	<cfloop condition="NOT bContinue">
		<cfset endTime 		= getTickCount() />
		<cfset elapsedTime  = endTime - startTime />
		
		<cfif elapsedTime gte arguments.timeToSleep>
			<cfset bContinue = true />
		</cfif>
	</cfloop>
	
</cffunction>