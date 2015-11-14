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
 Returns a form field as array, useful for when you have more than one form field with the same name.
 
 @param fieldName 	 Name of the Form or URL field (Required)
 @return Returns an array. 
 @author Ryan Stille (ryan@stillnet.org) 
 @version 1, August 5, 2011 
--->
<cffunction name="formFieldAsArray" returntype="array" output="false" hint="Returns a Form/URL variable as an array.">
	<cfargument name="fieldName" required="true" type="string" hint="Name of the Form or URL field" />

	<!--- Note: although we are getting the partsArray from the Form scope, it will contain URL values also. --->
	<cfset var tmpPartsArray = Form.getPartsArray() />
	<cfset var returnArray = arrayNew(1) /> 
	<cfset var tmpPart = 0 />
	<cfset var tmpValueArray = "" >
	
	<!--- if the getPartsArray method did not return NULL, then this is a multipart/form-data request, which must be handled as such. --->
	<cfif IsDefined("tmpPartsArray")>
		<cfloop array="#tmpPartsArray#" index="tmpPart">
			<cfif tmpPart.isParam() AND tmpPart.getName() EQ arguments.fieldName>
				<cfset arrayAppend(returnArray, tmpPart.getStringValue()) />
			</cfif>
		</cfloop>
	</cfif>
	
	<!--- Add the values that maybe on the URL with the same name, also if this *wasn't* a multipart/form-data request then
	the above code did not get any of the data, and the method below will return all of it. --->
	<cfset tmpValueArray = getPageContext().getRequest().getParameterValues(arguments.fieldName) />
	
	<!--- that may have returned null, so need to test for it. --->
	<cfif IsDefined("tmpValueArray")>
		<cfloop array="#tmpValueArray#" index="tmpPart">
			<cfset arrayAppend(returnArray, tmpPart) />
		</cfloop>
	</cfif>
	
	<cfreturn returnArray />
</cffunction>