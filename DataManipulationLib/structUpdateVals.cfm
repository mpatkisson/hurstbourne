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
 Update one structure values with values from another structure for those keys that match.
 
 @param struct1 	 The structure to be modified. (Required)
 @param struct2 	 The structure to copy values from. (Required)
 @return Returns a structure. 
 @author Jorge Loyo (loyoj@fiu.edu) 
 @version 1, December 22, 2005 
--->
<cffunction name="structUpdateVals" returntype="struct" output="false">
	<cfargument name="struct1" required="yes" type="struct" />
	<cfargument name="struct2" required="yes" type="struct"  />

	<cfloop collection="#struct2#" item="key">
		<cfif structKeyExists(struct1, key)>
			<cfset structUpdate(struct1, key, struct2[key]) />
	</cfif>
	</cfloop>		
	<cfreturn struct1 />
</cffunction>