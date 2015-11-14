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
 This function outputs the current value of an item based on straight line depreciation.
 
 @param acq_cost 	 Cost of item. (Required)
 @param act_date 	 Date item acquired. (Required)
 @param numberOfYears 	 Number of years to depreciate the item. (Required)
 @return Returns a number. 
 @author Steve Walker (sneakyllama@gmail.com) 
 @version 1, June 4, 2008 
--->
<cffunction name="getDepreciatedValue" output="no" returntype="numeric" hint="Calculates the current straight line depreciated value">
	<cfargument name="acq_cost" required="yes" type="numeric" hint="The acquistion cost or value of an item">
	<cfargument name="acq_date" type="date" required="yes" hint="the acquisition date of the item">
	<cfargument name="numberofYears" type="numeric" default="5" required="yes" hint="the number of years to depreciate the item.">
	<cfset var DV = "">
	<cfset var cost = arguments.acq_cost>
	<cfset var days = arguments.numberofYears * 365>
	<cfset var age = dateDiff('d', DateFormat(arguments.acq_date,'mm/dd/yyyy'), DateFormat(Now(),'mm/dd/yyyy'))>
	
	<cfif age gte days>
		<cfset age = days>
	</cfif>
	
	<cfset DV = (cost*((age/days)-1)*-1)>
	
	<cfreturn DV>
</cffunction>