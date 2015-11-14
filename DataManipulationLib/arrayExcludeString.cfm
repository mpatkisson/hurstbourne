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
 Excludes string items from an array.
 
 @param aObj 	 Array to filter. (Required)
 @return Returns an array. 
 @author Marcos Placona (marcos.placona@gmail.com) 
 @version 1, July 11, 2006 
--->
<cffunction name="arrayExcludeString" returntype="array">
	<cfargument name="aObj" type="array" required="Yes">
	<cfset var ii = "">
	
	<!--- Looping through the array --->
	<cfloop to="1" from="#arrayLen(aObj)#" index="ii" step="-1">
		<!--- Checking if it's a number --->
		<cfif not isNumeric(aObj[ii])>
			<cfset arrayDeleteAt(arguments.aObj, ii) />
		</cfif>
	</cfloop>
	
	<cfreturn aObj />
</cffunction>