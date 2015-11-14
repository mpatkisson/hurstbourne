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
 Pass in an XML Node and attribute reference to receive the attribute's value.
 
 @param node 	 XML note to retrieve the attribute from. (Required)
 @param attribute 	 Attribute to retrieve. (Required)
 @param default 	 If attribute does not exist, return this default. (Optional)
 @return Returns a string. 
 @author Kreig Zimmerman (kkz@foureyes.com) 
 @version 1, December 23, 2002 
--->
<cffunction name="GetXmlAttribute" output="false" returntype="any">
	<cfargument name="node" type="any" required="yes">
	<cfargument name="attribute" type="string" required="Yes">
	<cfargument name="default" type="string" default="" required="false">
	<cfset var myResult="#arguments.default#">
	<cfif StructKeyExists(node.XmlAttributes, attribute)>
		<cfset myResult=node.XmlAttributes["#attribute#"]>
	</cfif>
	<cfreturn myResult>
</cffunction>