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
 * Recursive functions to compare arrays and nested structures.
 * 
 * @param LeftArray 	 The first array. (Required)
 * @param RightArray 	 The second array. (Required)
 * @return Returns a boolean. 
 * @author Ja Carter (ja@nuorbit.com) 
 * @version 1, September 23, 2004 
 */
function arrayCompare(LeftArray,RightArray) {
	var result = true;
	var i = "";
	
	//Make sure both params are arrays
	if (NOT (isArray(LeftArray) AND isArray(RightArray))) return false;
	
	//Make sure both arrays have the same length
	if (NOT arrayLen(LeftArray) EQ arrayLen(RightArray)) return false;
	
	// Loop through the elements and compare them one at a time
	for (i=1;i lte arrayLen(LeftArray); i = i+1) {
		//elements is a structure, call structCompare()
		if (isStruct(LeftArray[i])){
			result = structCompare(LeftArray[i],RightArray[i]);
			if (NOT result) return false;
		//elements is an array, call arrayCompare()
		} else if (isArray(LeftArray[i])){
			result = arrayCompare(LeftArray[i],RightArray[i]);
			if (NOT result) return false;
		//A simple type comparison here
		} else {
			if(LeftArray[i] IS NOT RightArray[i]) return false;
		}
	}
	
	return true;
}
</cfscript>