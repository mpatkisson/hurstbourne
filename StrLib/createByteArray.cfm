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
 * Converts a ColdFusion string to a Java byte array
 * * version 1.0 by Marcos Placona
 * 
 * @param string 	 A string to convert to a byte array (Required)
 * @return Returns a byte array 
 * @author Marcos Placona (marcos.placona@gmail.com) 
 * @version 1.0, August 17, 2012 
 */
function createByteArray(string){
	var objString = createObject("Java", "java.lang.String").init(JavaCast("string", string));
	return objString.getBytes();
}
</cfscript>