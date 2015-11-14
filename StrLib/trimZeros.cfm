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
 * I trim leading and trailing zeros off of a decimal number.
 * version 1.0 by Alan McCollough
 * 
 * @param num 	 String to trim zeros from (Required)
 * @return A string with leading and trailing zeros removed 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1, August 26, 2012 
 */
function trimZeros(num){	
	if(val(num) == 0){
		return "0";
	} else if (num < 1) {
		return "." & listLast(num + 0,".");	
	} else {
		return num + 0;		
	} 	
}
</cfscript>