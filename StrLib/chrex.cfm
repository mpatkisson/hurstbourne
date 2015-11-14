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
 Charset attribute enabled extended chr function.
 
 @param value 	 Value to encode. (Required)
 @param charset 	 Character set. Defaults to systems default. (Optional)
 @param radix 	 Radix for value. (Optional)
 @return Returns a string. 
 @author Hiroshi Okugawa (okugawa@mail.com) 
 @version 1, July 15, 2004 
--->
<cffunction name="chrex" return="string" output="false">
  <cfargument name="value" type="string" required="true">
  <cfargument name="charset" type="string" required="false" default="">
  <cfargument name="radix" type="numeric" required="false" default="16">
  <cfset var a="">
  <cfset var tmp="">
  <cfset var st = "">
  <cfset var integer = "">
  <cfset var string = "">
  <cfset var byte = "">
  <cfset var system = "">
  
  <cfobject type="java" class="java.util.StringTokenizer" action="create" name="st">
  <cfobject type="java" class="java.lang.Integer" action="create" name="integer">
  <cfobject type="java" class="java.lang.String" action="create" name="string">
  <cfobject type="java" class="java.lang.Byte" action="create" name="byte">

  <cfif not len(arguments.charset)>
    <cfobject type="java" class="java.lang.System" action="create" name="system">
    <cfset arguments.charset=system.getProperty("file.encoding")>
  </cfif>
 
  <cfset a=arraynew(1)>
  <cfset st.init(arguments.value, " ,#chr(9)#")>
  <cfloop condition="#st.hasMoreTokens()#">
    <cfset tmp=integer.parseInt(st.nextToken(), arguments.radix)>
    <cfset arrayappend(a, byte.init(tmp))>
  </cfloop>
  <cfreturn string.init(a, arguments.charset)>
</cffunction>