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
 returns true if one of the values in the values list is found in the list.
 
 @param list 	 List of to search. (Required)
 @param values 	 List of values to search for. (Required)
 @param delimiters 	 List delimiter. Defaults to a comma. (Optional)
 @return Returns a boolean. 
 @author Sam Curren (telegramsam@byu.edu) 
 @version 1, August 5, 2005 
--->
<cffunction name="listFindOneOf" output="false" returntype="boolean">
	<cfargument name="list" type="string" required="yes"/>
	<cfargument name="values" type="string" required="yes"/>
	<cfargument name="delimiters" type="string" required="no" default=","/>
	<cfset var value = 0/>
	<cfloop list="#arguments.values#" index="value" delimiters="#arguments.delimiters#">
		<cfif ListFind(arguments.list, value, arguments.delimiters)>
			<cfreturn true />
		</cfif>
	</cfloop>
	<cfreturn false />
</cffunction>