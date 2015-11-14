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
 Parses Form data structure out of HTTP header; this leaves empty entries in, unlike CFMX.
 
 @return Returns a structure. 
 @author Ken Fricklas (kenf@accessnet.net) 
 @version 1, September 7, 2005 
--->
<cffunction name="parseRawForm" returnType="struct" output="false">
	<cfset var raw = GetHttpRequestData().content>
	<cfset var sNewForm = structNew()>
	<cfset var iKey = "">
	<cfset var iVal = "">

	<cfloop list="#raw#" index="iHdr" delimiters="&">
		<cfif right(iHdr,1) EQ "=">
			<cfset iKey = ucase(left(iHdr, len(iHdr) - 1))>
			<cfset iVal = "">
		<cfelse>
			<cfset iKey = ucase(getToken(iHdr, 1, "="))>
			<cfset iVal = getToken(iHdr, 2, "=")>
		</cfif>
		<cfif structKeyExists(sNewForm, iKey)>
			<cfset sNewForm[iKey] = sNewForm[iKey] & ",#iVal#">
		<cfelse>
			<cfset sNewForm[iKey] = URLDecode(iVal)>
		</cfif>
	</cfloop>
	<cfset sNewform.fieldnames = structKeyList(sNewForm)>
	<cfreturn sNewForm>
</cffunction>