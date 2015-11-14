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
 * Midstring: Return the middle part of a string between a specified start substring and a specified end substring.
 * 
 * @param string 	 The string to check. 
 * @param from 	 The initial string to use as a delimiter. 
 * @param to 	 The ending string to use as a delimiter. 
 * @return Returns the string between the delimiters. 
 * @author Andrew Cripps (andrew@cripps.net) 
 * @version 1, December 3, 2001 
 */
function midstring(string,from) {
	var start="";
	var end="";
	var lenstart="";
	var to=from;
	
	if(arrayLen(arguments) gte 3) to = arguments[3];
	
	start = refind(from,string);
	end = refind(to,string,len(from)+start);
	lenstart = len(from);
	return mid(string,start+lenstart,max(end-start-lenstart,0));
	
}
</cfscript>