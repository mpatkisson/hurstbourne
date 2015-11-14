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
 Converts a string of text from Quoted-Printable format to UTF-8.
 
 @param text 	 String to parse. (Required)
 @return Returns a string. 
 @author Isaac Dealey (info@turnkey.to) 
 @version 1, January 10, 2007 
--->
<cffunction name="parseQuotedPrintable" output="false">
	<cfargument name="text" type="string" required="true">
	<cfset var crlf = chr(13) & chr(10)>
	<cfset var char = "">
	<cfset var x = 0>
	
	<cfset text = ListToArray(crlf & text,"=")>
	<cfloop index="x" from="1" to="#arrayLen(text)#">
		<cfset char = left(text[x],2)>
		<cfset text[x] = removechars(text[x],1,2)>
		<cfif char is not crlf>
			<cfset text[x] = CHR(InputBaseN(char, 16)) & text[x]>
		</cfif>
	</cfloop>
	
	<cfreturn ArrayToList(text,"")>
</cffunction>