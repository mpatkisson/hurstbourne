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
 Converts a feed of lorem ipsum text into a string for output.
 
 @param isFormatted 	 strips lorem ipsum text of punctuation and uppercase (Optional)
 @return returns a string 
 @author Bret Feddern (bret@bricecheddarn.com) 
 @version 0, April 29, 2010 
--->
<cffunction name="cfLipsum" output="no" returntype="string" displayname="cfLipsum" hint="get a lorem ipsum string from lipsum.com">
	<cfargument name="isFormatted" type="numeric" required="no" default="1" />

	<cfset var theXML = "" />
	<cfset var theGrab = "" />
	<cfset var theLipsum = "" />
	<cfset var theLipsumFeed = "http://www.lipsum.com/feed/xml" />
	
	<!--- get the xml feed --->
	<cfhttp url="#theLipsumFeed#" method="get" resolveUrl="false" />
	
	<!--- parse and search xml for lorem ipsum --->
	<cfset theXML = XMLParse(cfhttp.filecontent) />
	<cfset theGrab = XMLSearch(theXML, "/feed") />
	
	<!--- only one lorem ipsum element in the feed --->
	<cfset theLipsum = theGrab[1].lipsum.xmltext />
	
	<!--- strips lorem ipsum text of punctuation and uppercase --->
	<cfif arguments.isFormatted neq 1>
		<cfset theLipsum = lcase(rereplacenocase(theLipsum, "[^a-z0-9 ]", "", "all")) />
	</cfif>
	
	<cfreturn theLipsum />
</cffunction>