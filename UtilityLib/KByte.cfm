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
 * Converts a byte value into kb or mb if over 1,204 bytes.
 * 
 * @param bytes 	 The number of bytes. (Required)
 * @return Returns a string. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, July 31, 2005 
 */
function KBytes(bytes) {
	var b=0;

	if(arguments.bytes lt 1024) return trim(numberFormat(arguments.bytes,"9,999")) & " bytes";
	
	b=arguments.bytes / 1024;
	
	if (b lt 1024) {
		if(b eq int(b)) return trim(numberFormat(b,"9,999")) & " KB";
		return trim(numberFormat(b,"9,999.9")) & " KB";
	}
	b= b / 1024;
	if (b eq int(b)) return trim(numberFormat(b,"999,999,999")) & " MB";
	return trim(numberFormat(b,"999,999,999.9")) & " MB";
}
</cfscript>