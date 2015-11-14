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
 Extracts the text of named XML elements and returns it in a list.
 
 @param inString 	 Either an XML object or a string representation. (Required)
 @param tagName 	 Tag to look for. (Required)
 @param delimiter 	 Delimiter for returned string. Defaults to a comma. (Optional)
 @return Returns a string. 
 @author Samuel Neff (sam@serndesign.com) 
 @version 1, March 16, 2004 
--->
<cffunction name="xmlExtractList" returnType="string" output="no">
   <cfargument name="inString" type="any">
   <cfargument name="tagName" type="string">
   <cfargument name="delim" default=",">
   
   <cfset var inXML = "">
   
   <cfset var elementsArray = "">
   <cfset var valuesArray = arrayNew(1)>
   <cfset var i=1>
   <cfset var j=1>
   <cfset var ret = "">
   
   <cfif isXmlDoc(arguments.inString)>
      <cfset inXML = arguments.inString>
   <cfelse>
      <cfset inXML  = xmlParse(arguments.inString)>
   </cfif>
   
   <cfset elementsArray = xmlSearch(inXML, "//" & arguments.tagName)>

   
   <cfloop index="j" from="1" to="#arrayLen(elementsArray)#">
      <cfif elementsArray[j].xmlText neq "">
         <cfset valuesArray[i] = elementsArray[j].xmlText>
         <cfset i=i+1>
      </cfif>
   </cfloop>
   
   <cfset ret = arrayToList(valuesArray, arguments.delim)>
   <cfreturn ret>
</cffunction>