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
 Finds all occurences of a regex in a string.
 
 @param regExpression 	 The regular expression to test with (Required)
 @param string 	 String to search. (Required)
 @param start 	 Starting position. Defaults to 1. (Optional)
 @param caseSensitive 	 Whether or not to use case sensitive matching.  Defaults to false. (Optional)
 @return Returns an array of structs. 
 @author Raymond Selzer (raymond@kingcommedia.com) 
 @version 1, October 11, 2011 
--->
<cffunction name="reFindAll" output="yes" returntype="array">
	<cfargument name="regExpression" type="string" required="yes">
    <cfargument name="string" type="string" required="yes">
    <cfargument name="start" type="numeric" required="no" default="1">
    <cfargument name="caseSensitive" type="boolean" required="no" default="false">
    
    <cfset var result = arrayNew(1)>
    <cfset var matches = ''>
    
    <cfif caseSensitive>
    	<cfset matches = refind(regExpression,string,start,true)>
    <cfelse>
    	<cfset matches = refindnocase(regExpression,string,start,true)>
    </cfif>
    
    <cfloop condition="#matches.len[1]# neq 0">
    	
        <cfset result[arraylen(result) + 1] = matches> 
        <cfset start = matches.pos[1] + matches.len[1]>
        
        <cfif caseSensitive>
			<cfset matches = refind(regExpression,string,start,true)>
        <cfelse>
            <cfset matches = refindnocase(regExpression,string,start,true)>
        </cfif>
        
    </cfloop>
    
    <cfreturn result>
</cffunction>