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
 Finds within a given string the location of the first occurrence of any element in a list.
 
 @param valueList 	 List of values to check for. (Required)
 @param stringtocompare 	 String to be searched. (Required)
 @param start 	 Optional starting position. Defaults to 1.  (Optional)
 @param delim 	 List delimiter. Defaults to a comma. (Optional)
 @return The position of first found list element in string; or 0, if no list elements are in string. 
 @author Charlie Arehart (charlie@carehart.org) 
 @version 0, September 15, 2008 
--->
<cffunction name="findList" returnType="numeric" output="false">
	<cfargument name="valuelist" required="Yes" type="string">
	<cfargument name="stringtocompare" required="Yes" type="string">
	<cfargument name="start" required="No" type="numeric" default="0">
	<cfargument name="delim" required="no" type="string" default=",">
	<cfset var test=arrayNew(1)>
	<cfset var x = "">


	<cfloop list="#arguments.valuelist#" index="x" delimiters="#arguments.delim#">
		<cfset ArrayAppend(test,findnocase(x,arguments.stringtocompare, arguments.start)) />
	</cfloop>

	<cfreturn arrayMin(test) />
</cffunction>