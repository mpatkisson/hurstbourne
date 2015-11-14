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
 Compares two date ranges to determine if they overlap by one or more days.
 
 @param start1 	 Initial date of the first range. (Required)
 @param end1 	 Ending date of the second range. (Required)
 @param start2 	 Initial date of the second range. (Required)
 @param end2 	 Ending date of the second range. (Required)
 @return Returns a boolean. 
 @author Leigh (cfsearching@yahoo.com) 
 @version 1, January 20, 2009 
--->
<cffunction name="dateRangesOverlap" returntype="boolean" output="false" hint="Returns true if two date ranges overlap by one or more days">
	<cfargument name="start1" type="date" required="true">
	<cfargument name="end1" type="date" required="true">
	<cfargument name="start2" type="date" required="true">
	<cfargument name="end2" type="date" required="true">
	<cfset var overlapFound = false>
	<cfset var datePart = "d">

	<cfif dateCompare(arguments.end1, arguments.start1, datePart) eq -1>
		<cfthrow message="End1 date cannot be earlier than start1 date">
	<cfelseif dateCompare(arguments.end2, arguments.start2, datePart) eq -1>
		<cfthrow message="End2 date cannot be earlier than start2 date">
	</cfif>
	<!--- first range starts within the second date range --->
	<cfif dateCompare(arguments.start1, arguments.start2, datePart) gte 0 and 
				dateCompare(arguments.start1, arguments.end2, datePart) lte 0>
		<cfset overlapFound = true>	
	<!--- first range ends within the second date range --->
	<cfelseif dateCompare(arguments.end1, arguments.start2, datePart) gte 0 and 
				dateCompare(arguments.end1, arguments.end2, datePart) lte 0>
		end between
		<cfset overlapFound = true>	
	<!--- first range spans the second date range --->
	<cfelseif dateCompare(arguments.start1, arguments.start2, datePart) lte 0 and 
				dateCompare(arguments.end1, arguments.end2, datePart) gte 0>
		spans		
		<cfset overlapFound = true>	
	</cfif>

	<cfreturn overlapFound>
</cffunction>