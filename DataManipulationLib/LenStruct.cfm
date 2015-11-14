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
 * Computes the length of every key in the passed structure and returns a structure with unique key names of the lengths.
 * 
 * @param structIn 	 The struct to check. (Required)
 * @param excludeList 	 List of keys to ignore. (Optional)
 * @param ending 	 String to append to key names in resulting struct. (Optional)
 * @return Returns a struct. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, October 5, 2004 
 */
function LenStruct(structIn) {
	var i = 0;
	var structIn_count = StructCount(structIn);
	var struct0ut = StructNew();
	var ending = "_Len";
	var excludeList = "";
	var key = "";
	
	// Check if excludeList was passed
	if(arrayLen(Arguments) GT 1) {
		excludeList = Arguments[2];
	} 
	
	// Check if different ending was passed
	if(arrayLen(Arguments) GT 2) {
		ending = Arguments[3];
	} 
	for (key IN structIn) {
		if (NOT listFindNoCase(excludeList,key) AND isSimpleValue(structIn[key])) {
			structOut[key&ending] = Len(structIn[key]);
		} 
	} 
	return structOut;
}
</cfscript>