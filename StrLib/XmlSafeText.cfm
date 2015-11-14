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
 Replacement for XmlFormat that also replaces all special characters.
 
 @param txt 	 String to format. (Required)
 @return Returns a string. 
 @author David Hammond (dave@modernsignal.com) 
 @version 0, July 12, 2009 
--->
<cffunction name="XmlSafeText" hint="Replaces all characters that would break an xml file." returnType="string" output="false">		
	<cfargument name="txt" type="string" required="true">
	<cfset var chars = "">
	<cfset var replaced = "">
	<cfset var i = "">
	
	<!--- Use XmlFormat function first --->
	<cfset txt = XmlFormat(txt)>
	<!--- Get all other characters to replace. ---> 
	<cfset chars = REMatch("[^[:ascii:]]",txt)>
	<!--- Loop through characters and do replace. Maintain a list of characters already replaced to avoid duplicate work. --->
	<cfloop index="i" from="1" to="#ArrayLen(chars)#">
		<cfif listFind(replaced,chars[i]) is 0>
			<cfset txt = Replace(txt,chars[i],"&##" & asc(chars[i]) & ";","all")>
			<cfset replaced = ListAppend(replaced,chars[i])>
		</cfif>
	</cfloop>
	<cfreturn txt>
</cffunction>