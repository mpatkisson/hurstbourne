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
 Merge two simple structures in one combining keys or creating new ones.
 
 @param struct1 	 The first struct. (Required)
 @param struct2 	 The second struct. (Required)
 @return Returns a struct. 
 @author Marcos Placona (marcos.placona@gmail.com) 
 @version 1, March 2, 2006 
--->
<cffunction name="structMerge" output="false">
	<cfargument name="struct1" type="struct" required="true">
	<cfargument name="struct2" type="struct" required="true">
	<cfset var ii = "" />
	
	<!--- Loop over the second structure passed --->
	<cfloop collection="#arguments.struct2#" item="ii">
		<cfif structKeyExists(struct1,ii)>
		<!--- In case it already exists, we just update it --->
			<cfset struct1[ii] = listAppend(struct1[ii], struct2[ii])>
		<cfelse>
		<!--- In all the other cases, just create a new key with the values or list of values --->
			<cfset struct1[ii] = struct2[ii] />
		</cfif>
	</cfloop>
	<cfreturn struct1 />
</cffunction>