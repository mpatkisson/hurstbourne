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
 Searches recursively through a substructure of nested arrays, structures, and other elements for structures with values that match the search. pattern in the reg_expression parameter.
 
 @param top 	 Top level structure to search. (Required)
 @param reg_expression 	 Regular expression used for search. (Required)
 @param scope 	 Scope to use for search. If one, finds the first result, otherwise returns all results. Defaults to one. (Optional)
 @param owner 	 Pointer to item searched. Normally not passed. Defaults to top. (Optional)
 @param path 	 Path to search for within the data. Again, normally not passed. (Optional)
 @param results 	 Carries the results value and used recursively.  (Optional)
 @return Returns an array. 
 @author Nathan Mische (nmische@gmail.com) 
 @version 0, July 12, 2009 
--->
<cffunction name="REStructFindValue" returntype="array" output="false">
	<cfargument name="top" type="any" required="true">
	<cfargument name="reg_expression" type="string" required="true">
	<cfargument name="scope" type="string" required="false">
	<cfargument name="owner" type="any" required="false">
	<cfargument name="path" type="string" required="false">
	<cfargument name="results" type="any" required="false">
	
	<cfset var key = "">
	<cfset var i = "">
	<cfset var result="">	
	
	<!--- set default values --->
	<cfif not StructKeyExists(arguments,"scope")>
		<cfset arguments.scope = "one">
	</cfif>
	
	<cfif not StructKeyExists(arguments,"owner")>
		<cfset arguments.owner = arguments.top>
	</cfif>
	
	<cfif not StructKeyExists(arguments,"path")>
		<cfset arguments.path = "">
	</cfif>
	
	<cfif not StructKeyExists(arguments,"results")>
		<cfset arguments.results = CreateObject("java","java.util.ArrayList").init()>
	</cfif>
	
	<!--- exit if scope is "one" and we have a result --->
	<cfif CompareNoCase(arguments.scope,"one") eq 0
		and ArrayLen(arguments.results) eq 1>
				
		<cfreturn arguments.results>
		
	</cfif>
		
	<!--- recurse or do test depending on type --->
	<cfif IsStruct(arguments.top)>	
	
		<cfloop collection="#arguments.top#" item="key">	
			<cfset REStructFindValue(arguments.top[key],arguments.reg_expression,arguments.scope,arguments.top,"#arguments.path#.#key#",arguments.results)>
		</cfloop>		
		
	<cfelseif IsArray(arguments.top)>
	
		<cfloop from="1" to="#ArrayLen(arguments.top)#" index="i">	
			<cfset REStructFindValue(arguments.top[i],arguments.reg_expression,arguments.scope,arguments.top,"#path#[#i#]",arguments.results)>
		</cfloop>
		
	<cfelseif IsSimpleValue(arguments.top)
		and IsStruct(arguments.owner)
		and REFind(arguments.reg_expression,arguments.top)>			
			
		<cfset result = StructNew()>
		<cfset result["key"] = ListLast(arguments.path,".")>
		<cfset result["owner"] = arguments.owner>
		<cfset result["path"] = arguments.path>		
		<cfset ArrayAppend(arguments.results,result)>
		
	</cfif>
		
	<cfreturn arguments.results>
			
</cffunction>