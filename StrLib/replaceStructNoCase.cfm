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
 Returns string, with occurence of structure key names replaced by structure values.
 
 @param argString 	 String to parse. (Required)
 @param argStruct 	 Structure to use for values. (Required)
 @param argStartSymbol 	 Symbol used to denote beginning of token. Defaults to { (Optional)
 @param argEndSymbol 	 Symbol used to denote end of token. Defaults to }. (Optional)
 @return Returns a string. 
 @author Rodion Bykov (rodionbykov@rodionbykov.com) 
 @version 1, May 30, 2011 
--->
<cffunction name="replaceStructNoCase" returntype="string">
	<cfargument name="argString" type="string" required="true" />
	<cfargument name="argStruct" type="struct" required="true" />
	<cfargument name="argStartSymbol" type="string" required="false" default="{" />
	<cfargument name="argEndSymbol" type="string" required="false" default="}" />
	
	<cfset var result = "" />
	<cfset var i = "" />
	
	<cfset result = arguments.argString />
	
	<cfloop collection="#arguments.argStruct#" item="i">
		<cfset result = replaceNoCase( result, arguments.argStartSymbol & i & arguments.argEndSymbol, StructFind(arguments.argStruct, i), "all" ) />
	</cfloop>
	
	<cfreturn result />
</cffunction>