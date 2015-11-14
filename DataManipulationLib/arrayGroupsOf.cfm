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
 Splits or iterates over the array in number of groups.
 
 @param arrObj 	 Array to split up in groups. (Required)
 @param intGroup 	 Number of items allowed on each group. (Required)
 @param padding 	  What should it be filled with in case there's empty slots. (Optional)
 @return Returns an array. 
 @author Marcos Placona (marcos.placona@gmail.com) 
 @version 1, February 4, 2010 
--->
<cffunction name="arrayGroupsOf" access="public" output="false" returntype="array">
	<cfargument name="arrObj" type="array" required="true" hint="An array object that will be split up in groups">
	<cfargument name="intGroup" type="numeric" required="true" hint="Number of items on each group">
	<cfargument name="padding" type="string" required="false" default=" " hint="What should it be filled with in case there's empty slots">
	
	<cfset var resArray = createObject("java", "java.util.ArrayList").Init(arguments.arrObj) />
	<cfset var arrGroup = arrayNew(1) />
	<cfset var arrObjGroup = arrayNew(1) />
	<cfset var arrObjSize = resArray.size()>
	<cfset var subStart = 0>
	<cfset var subEnd = arguments.intGroup>
	<cfset var ii = "">
	<cfset var difference = "">
	<cfset var jj = "">
	
	<cfset arrGroupSize = ceiling(arrObjSize / arguments.intGroup)>
	<cfset arrArrayGroupSize = arrGroupSize * arguments.intGroup>
	
	<cfif arrArrayGroupSize GT arrObjSize>
		<cfset difference = arrArrayGroupSize - arrObjSize>
		<cfloop from="1" to="#difference#" index="ii">
			<cfset resArray.add(arguments.padding) />
		</cfloop>
	</cfif>
	
	<cfloop from="1" to="#arrGroupSize#" index="jj">			
		<cfset arrGroup = resArray.subList(subStart, subEnd)>		
		<cfset arrayAppend(arrObjGroup, arrGroup)>
		
		<cfset subStart = subStart + arguments.intGroup>
		<cfset subEnd = subEnd  + arguments.intGroup>
		<cfset arrGroup = arrayNew(1) />
	</cfloop>
	
	<cfreturn arrObjGroup>

</cffunction>