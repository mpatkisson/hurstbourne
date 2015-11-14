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
 Serializes data to JSONP format for cross domain JSON requests.
 
 @param data 	 Data to be converted into JSON. (Required)
 @param callback 	 The function call that will wrap the output. (Required)
 @return Returns a string. 
 @author Steve Good (sgood@lanctr.com) 
 @version 0, June 11, 2009 
--->
<cffunction name="serializeToJSONP" displayname="Serialize to JSONp" hint="Serializes supplied data in JSONp format" output="false" returntype="any">
	<cfargument name="data" displayName="data" type="any" hint="The data to serialize" required="true" />
	<cfargument name="callback" displayName="callback" type="string" hint="the jsonp callback to use" required="true" />
	
	<cfscript>
	var local = {};
	local.json = serializeJSON(arguments.data);
	local.jsonp = arguments.callback & '(' & local.json & ')';
	</cfscript>
	
	<cfreturn local.jsonp />
</cffunction>