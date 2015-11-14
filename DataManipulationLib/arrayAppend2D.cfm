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
 * Appends two values to a 2D array.
 * 
 * @param aName 	 The array. (Required)
 * @param value1 	 First value. (Required)
 * @param value2 	 Second value. (Required)
 * @return Returns the array. 
 * @author Minh Lee Goon (contact@digeratidesignstudios.com) 
 * @version 1, March 21, 2006 
 */
function arrayAppend2D(aName, value1, value2) {
	var theLen = arrayLen(aName);
		
	aName[theLen+1][1] = value1;
	aName[theLen+1][2] = value2;
		
	return aName;
}
</cfscript>