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
 indentXml pretty-prints XML and XML-like markup without requiring valid XML.
 
 @param xml 	 XML string to format. (Required)
 @param indent 	 String used for creating the indention. Defaults to a space. (Optional)
 @return Returns a string. 
 @author Barney Boisvert (bboisvert@gmail.com) 
 @version 2, July 30, 2010 
--->
<cffunction name="indentXml" output="false" returntype="string">
  <cfargument name="xml" type="string" required="true" />
  <cfargument name="indent" type="string" default="  "
    hint="The string to use for indenting (default is two spaces)." />
  <cfset var lines = "" />
  <cfset var depth = "" />
  <cfset var line = "" />
  <cfset var isCDATAStart = "" />
  <cfset var isCDATAEnd = "" />
  <cfset var isEndTag = "" />
  <cfset var isSelfClose = "" />
  <cfset xml = trim(REReplace(xml, "(^|>)\s*(<|$)", "\1#chr(10)#\2", "all")) />
  <cfset lines = listToArray(xml, chr(10)) />
  <cfset depth = 0 />
  <cfloop from="1" to="#arrayLen(lines)#" index="i">
    <cfset line = trim(lines[i]) />
    <cfset isCDATAStart = left(line, 9) EQ "<![CDATA[" />
    <cfset isCDATAEnd = right(line, 3) EQ "]]>" />
    <cfif NOT isCDATAStart AND NOT isCDATAEnd AND left(line, 1) EQ "<" AND right(line, 1) EQ ">">
      <cfset isEndTag = left(line, 2) EQ "</" />
      <cfset isSelfClose = right(line, 2) EQ "/>" OR REFindNoCase("<([a-z0-9_-]*).*</\1>", line) />
      <cfif isEndTag>
        <!--- use max for safety against multi-line open tags --->
        <cfset depth = max(0, depth - 1) />
      </cfif>
      <cfset lines[i] = repeatString(indent, depth) & line />
      <cfif NOT isEndTag AND NOT isSelfClose>
        <cfset depth = depth + 1 />
      </cfif>
    <cfelseif isCDATAStart>
      <!---
      we don't indent CDATA ends, because that would change the
      content of the CDATA, which isn't desirable
      --->
      <cfset lines[i] = repeatString(indent, depth) & line />
    </cfif>
  </cfloop>
  <cfreturn arrayToList(lines, chr(10)) />
</cffunction>