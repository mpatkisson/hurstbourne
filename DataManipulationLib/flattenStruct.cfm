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
 Builds nested structs into a single struct.
 Updated v2 by author Simeon Cheeseman.
 
 @param stObject 	 Structure to flatten. (Required)
 @param delimiter 	 Value to use in new keys. Defaults to a period. (Optional)
 @param prefix 	 Value placed in front of flattened keys. Defaults to nothing. (Optional)
 @param stResult 	 Structure containing result. (Optional)
 @param addPrefix 	 Boolean value that determines if prefix should be used. Defaults to true. (Optional)
 @return Returns a structure. 
 @author Tom de Manincor (tomdeman@gmail.com) 
 @version 2, September 2, 2011 
--->
<cffunction name="flattenStruct" access="public" output="false" returntype="struct">
	<cfargument name="original" type="struct" required="true"><!--- struct to flatten --->
    <cfargument name="delimiter" required="false" type="string" default="." />
	<cfargument name="flattened" type="struct" default="#StructNew()#" required="false"><!--- result struct, returned at the end --->
	<cfargument name="prefix_string" type="string" default="" required="false"><!--- used in the processing, stores the preceding struct names in the current branch, ends in a delimeter --->
	
	<!--- get this level's elements --->
	<cfset var names = StructKeyArray(original)>
	<cfset var name = "">
	
	<cfloop array="#names#" index="name">
		<!--- add name --->
		<cfif IsStruct(original[name])>
			<cfset flattened = flattenStruct(original[name], delimiter, flattened, prefix_string & name & delimiter)>
		<cfelse>
			<cfset flattened[prefix_string & name] = original[name]>
		</cfif>
	</cfloop>
	
	<cfreturn flattened>
</cffunction>