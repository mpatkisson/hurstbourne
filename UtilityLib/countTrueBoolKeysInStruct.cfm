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
 * I loop through a struct that contains keys set to boolean values and return count of how many keys evaluate true.
 * v0.1 by Alan McCollough
 * v1.0 by Adam Cameron.  VARing
 * 
 * @param strc 	 A struct to count positive booleans (Required)
 * @return Returns a numeric value that is the number of boolean TRUE values found in the struct 
 * @author Alan McCollough (amccollough@anthc.org) 
 * @version 1.0, September 16, 2012 
 */
function countTrueBoolKeysInStruct(strc){
	var x = 0;
	var i = 0;
	for(i in strc) {
		if (isBoolean(strc[i]) && strc[i]){
			x++;
		}
	};
	return x;
};
</cfscript>