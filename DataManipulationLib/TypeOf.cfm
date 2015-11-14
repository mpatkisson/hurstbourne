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

<cfscript>
/**
 * Returns the type of the variable.
 * Made it cf5/mx compat with use of getFunctionList
 * 
 * @param x 	 The data to inspect. (Required)
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 3, August 16, 2002 
 */
function TypeOf(x) {
   if(isArray(x)) return "array";
   if(isStruct(x)) return "structure";
   if(isQuery(x)) return "query";
   if(isSimpleValue(x) and isWddx(x)) return "wddx";
   if(isBinary(x)) return "binary";
   if(isCustomFunction(x)) return "custom function";
   if(isDate(x)) return "date";
   if(isNumeric(x)) return "numeric";
   if(isBoolean(x)) return "boolean";
   if( listFindNoCase( structKeyList( GetFunctionList() ), "isXMLDoc" ) AND
isXMLDoc(x)) return "xml";
   if(isSimpleValue(x)) return "string";
   return "unknown";  
}
</cfscript>