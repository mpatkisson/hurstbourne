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
 * Remove elements from one array which exist in another array.
 * 
 * @param baseArray 	 Main array of values. (Required)
 * @param deleteArray 	 Array of values to delete. (Required)
 * @return Returns an array. 
 * @author Jason Rushton (jason@iworks.com) 
 * @version 1, April 11, 2008 
 */
function arrayDeleteArray( baseArray, deleteArray ) {
	arguments.baseArray.removeAll(arguments.deleteArray);
	return arguments.baseArray;
}
</cfscript>