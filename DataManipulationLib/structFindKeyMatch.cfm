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
 Like structFindKey except it matches a pattern.
 
 @param scope 	 Structure to search. (Required)
 @param keyword 	 Keyword to search for. (Required)
 @return Returns an array. 
 @author Jeff Gladnick (jeff@greatdentalwebsites.com) 
 @version 1, August 25, 2011 
--->
<cffunction name="structFindKeyMatch" returntype="array" output="false">
	<cfargument name="scope" type="struct" required="true">
	<cfargument name="keyword" type="string" required="true">
	
	<cfset var key = "">
	<cfset var i = "">
	<cfset var result = arrayNew(1)>    
	<cfset var tempstruct = structNew() />
	
	<cfloop index="i" list="#StructKeyList(arguments.scope)#" delimiters=",">  
		<cfif findNoCase(arguments.keyword,i)>
			<cfset tempstruct[i] = arguments.scope[i]>
			<cfset arrayAppend(result, duplicate(tempstruct)) />	
		</cfif>
	
		<cfset structClear(tempstruct) />
	</cfloop>
	
	<cfreturn result>
        
</cffunction>