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
 I generate concatenated name-value pairs from forms.
 
 @param formStruct 	 form structure (Required)
 @param doNotProcessList 	 List of fields to ignore (Optional)
 @return Returns a string 
 @author Stephen Withington (steve@stephenwithington.com) 
 @version 0, June 17, 2009 
--->
<cffunction name="formToNameValuePairs" returntype="string" output="false" access="remote"
			hint="pass me a form and i'll generate concatenated name-value pairs.">

	<cfargument name="formStruct" type="struct" required="true" hint="the form struct to parse and concatenate" />
	<cfargument name="doNotProcessList" type="string" required="false" hint="a list of form fields to ignore" default="" />

	<cfset var local = structNew() />
	<cfset local.nameValuePairs = "" />
	<cfset local.doNotProcess = arguments.doNotProcessList />
	<cfset local.field = "" />

	<cfif structKeyExists(arguments,"formStruct") and structKeyExists(arguments.formStruct,"fieldnames")>
	    	<cfloop list="#arguments.formStruct.fieldnames#" index="local.field"> 
	    	    <cfif not listFindNoCase(local.doNotProcess,local.field)>
	    	        <cfset local.doNotProcess = listAppend(local.doNotProcess,local.field) />
	        	    <cfset local.nameValuePairs = listAppend(local.nameValuePairs,lcase(local.field) & "=" & urlEncodedFormat(form[local.field], "utf-8"), "&") />                        
	    	   	 </cfif>
	    	</cfloop>
	   </cfif>	

	<cfreturn local.nameValuePairs />    
</cffunction>