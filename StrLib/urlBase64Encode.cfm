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
 * Encodes a string to base64 format, then urlEncodes the result so that it works when used as part of a URL string.
 * 
 * @param str 	 String to format. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, August 10, 2007 
 */
function urlBase64Encode(str){
	
	/* encodes a string to base64 format,
	then urlEncodes the result so that it
	works when used as part of a URL string */
	
	var result = "";
	
	/* convert string to base64 format */
	result = toBase64(str);
	
	/* urlEncode to convert base64 chars that do not work when rendered in a URL 
	Note that this uses the single-argument format to work with earlier versions of CF. */
	result = urlEncodedFormat(result);
	
	return result;
};
</cfscript>