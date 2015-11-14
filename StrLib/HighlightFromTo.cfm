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
 * Applies a simple highlight from and to a given position in a string.
 * version 2 by rcmamden
 * 
 * @param str 	 String to modify. (Required)
 * @param start 	 Position to insert highlight. (Required)
 * @param end 	 Position to end highlight. (Required)
 * @param startHi 	 String to use for the beginning of the highlight. Defaults to <span style="background-color: yellow;"> (Optional)
 * @param endHi 	 String to use for the end of the highlight. Defaults to </span> (Optional)
 * @return Returns a string. 
 * @author Scott Delatush (delatush@yahoo.com) 
 * @version 2, September 24, 2002 
 */
function HighLightFromTo(str,start, end) {
	var startHi = "<span style=""background-color: yellow;"">";
	var endHi = "</span>";

	if(arrayLen(arguments) gte 4) startHi = arguments[4];
	if(arrayLen(arguments) gte 5) endHi = arguments[5];

	if(start gte (len(str) - 1)) return str;
	if(end gte len(str)) end = len(str);

	str = insert(startHi,str,start-1);
	str = insert(endHi,str,end+len(startHi));
	return str;
}
</cfscript>