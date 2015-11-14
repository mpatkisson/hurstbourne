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
 Converts an CF XML objects to string without the XML declaration.
 
 @param xmlDoc 	 Either a XML document or string. (Required)
 @return Returns a string. 
 @author Massimo Foti (massimo@massimocorner.com) 
 @version 1, August 2, 2003 
--->
<cffunction name="xmlDoctoString" output="no" returntype="string" displayname="xmlDoctoString" hint="Extract the root element inside an XML Doc and return it as a string">
	<cfargument name="xmlDoc" type="string" required="true" displayname="xmlDoc" hint="An XML Doc or a well formed XML string">
	<cfset var xmlToParse="">
	<!--- Check to see if the argument is already an XMLDoc --->
	<cfif IsXmlDoc(arguments.xmlDoc)>
		<cfset xmlToParse=arguments.xmlDoc>
	<cfelse>
		<!--- We need a parsed XML doc, not just a simple string --->
		<cftry>
			<cfset xmlToParse=XmlParse(arguments.xmlDoc, "yes")>
			<!--- Failed parsing, the string culd be not a well formed XML, throw an exception --->
			<cfcatch type="Any">
				<cfthrow message="xmlDoctoString: failed to parse argument.xmlDoc" type="xmlDoctoString">
			</cfcatch>
		</cftry>
	</cfif>
	<cfreturn xmlToParse.getDocumentElement().toString()>
</cffunction>