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
 * Turns a string to an array of 'count' character chunks.
 * 
 * @param string 	 String to parse. (Required)
 * @param count 	 Number of characters per array index. (Required)
 * @return Returns an array. 
 * @author Aidan Whitehall (aidan@thenetprofits.co.uk) 
 * @version 1, June 12, 2003 
 */
function stringToArray(string, count) {
   var array = arrayNew(1);
   
   while (len(string)) {
      arrayAppend(array, left(string, min(count, len(string))));
      
      if ((len(string) / count) gt 1) string = right(string, len(string) - count);
      else string = "";
   }

   return array;
}
</cfscript>