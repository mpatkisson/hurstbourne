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
 * Recursive functions to compare structures and arrays.
 * Fix by Jose Alfonso.
 * 
 * @param LeftStruct 	 The first struct. (Required)
 * @param RightStruct 	 The second structure. (Required)
 * @return Returns a boolean. 
 * @author Ja Carter (ja@nuorbit.com) 
 * @version 2, October 14, 2005 
 */
function structCompare(LeftStruct,RightStruct) {
	var result = true;
	var LeftStructKeys = "";
	var RightStructKeys = "";
	var key = "";
	
	//Make sure both params are structures
	if (NOT (isStruct(LeftStruct) AND isStruct(RightStruct))) return false;

	//Make sure both structures have the same keys
	LeftStructKeys = ListSort(StructKeyList(LeftStruct),"TextNoCase","ASC");
	RightStructKeys = ListSort(StructKeyList(RightStruct),"TextNoCase","ASC");
	if(LeftStructKeys neq RightStructKeys) return false;	
	
	// Loop through the keys and compare them one at a time
	for (key in LeftStruct) {
		//Key is a structure, call structCompare()
		if (isStruct(LeftStruct[key])){
			result = structCompare(LeftStruct[key],RightStruct[key]);
			if (NOT result) return false;
		//Key is an array, call arrayCompare()
		} else if (isArray(LeftStruct[key])){
			result = arrayCompare(LeftStruct[key],RightStruct[key]);
			if (NOT result) return false;
		// A simple type comparison here
		} else {
			if(LeftStruct[key] IS NOT RightStruct[key]) return false;
		}
	}
	return true;
}
</cfscript>