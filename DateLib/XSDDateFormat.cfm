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
 * Takes an Date/Time and makes it into XSD time format (for use in xml xsds)
 * 
 * @param str_date 	 Date/time you want converted to XSD format. 
 * @return Returns a string. 
 * @author Rob (r2) (rob@rtwo.net) 
 * @version 1, March 18, 2002 
 */
function XSDDateFormat(str_date){
   return DateFormat(str_date,"yyyy-mm-ddT") & TimeFormat(str_date,"HH:mm:ss");
}
</cfscript>