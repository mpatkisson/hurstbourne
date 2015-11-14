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
 Converts an XML Object into a single flattened struct.
 
 @param xmlObject 	 XML object to flatten. (Required)
 @param delimiter 	 Delimits keys. Defaults to . (Optional)
 @param prefix 	 Prefixes keys. Defaults to nothing. (Optional)
 @param stResult 	 Result struct. Allows you to pass in a structure by reference. (Optional)
 @param addPrefix 	 Boolean that determines if the prefix attribute is used. Defaults to tru. (Optional)
 @return Returns a struct. 
 @author Arden Harrell (ArdMan_Da_Codehead@YAHOO.com) 
 @version 1, February 24, 2011 
--->
<cffunction name="flattenXmlToStruct" access="public" output="false" returntype="struct">
    <cfargument name="xmlObject" required="true" type="xml" />
    <cfargument name="delimiter" required="false" type="string" default="." />
    <cfargument name="prefix"      required="false" type="string" default="" />
    <cfargument name="stResult" required="false" type="struct" />
    <cfargument name="addPrefix" required="false" type="boolean" default="true" />
    
    <cfset var sKey = '' />
	<cfset var currentKey = "">
	<cfset var arrIndx = "">
	
	<cfif NOT isDefined("arguments.stResult")>
	  <cfset arguments.stResult = structNew()>
	</cfif>
    
    <cfloop from="1" to="#ArrayLen(arguments.xmlObject.XmlChildren)#" index="arrIndx">
	   
	   <cfset sKey = arguments.xmlObject.XmlChildren[arrIndx].XmlName>
	   
	   <cfif ArrayLen(arguments.xmlObject.XmlChildren[arrIndx].XmlChildren) EQ 0>
            <cfif arguments.addPrefix and len(arguments.prefix)>
                <cfset arguments.stResult["#arguments.prefix##arguments.delimiter##sKey#"] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
            <cfelse>
                <cfset arguments.stResult[sKey] = arguments.xmlObject.XmlChildren[arrIndx].XmlText />
            </cfif>
	     
	   <cfelse>	<!--- Node has more children... --->

			<cfif arguments.prefix EQ "">
			  <cfset currentKey = sKey>
			<cfelse>
			  <cfset currentKey = "#arguments.prefix##arguments.delimiter##sKey#">
			</cfif>
            <cfset flattenXmlToStruct(arguments.xmlObject.XmlChildren[arrIndx], arguments.delimiter, currentKey, arguments.stResult) />    
	   
	   </cfif>
    </cfloop>
	
    <cfreturn arguments.stResult />
</cffunction>