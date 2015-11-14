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
 * Converts a structure into a key/value pair list.
 * 
 * @param struct 	 Structure to list. (Required)
 * @param delimiter 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Kit Brandner (kit.brandner@serebra.com) 
 * @version 1, November 6, 2006 
 */
function structValueList(struct) {
	var delimiter = ",";
	var element = 0;
	var kvName = "";
	var kvValue = "";
	var returnList = "";
		
	if(arrayLen(arguments) gt 1) delimiter = arguments[2];
		
	if (isStruct(struct)) {
		for (; element lt listLen(structKeyList(struct, delimiter)) ; element=element+1) {
			kvName = listGetAt(structKeyList(struct, delimiter), element+1, delimiter);
			kvValue = "";
			if(isSimpleValue(struct[kvName])) kvValue = struct[kvName];
			returnList = listAppend(returnList, kvName & iif(len(trim(kvValue)) gt 0, de("=" & kvValue), de("")));
		}
	}
	
	return returnList;
}
</cfscript>