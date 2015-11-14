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
 * Validates if item is orm entity or collection.
 * 
 * @param item 	 Value to check. (Required)
 * @return Returns a boolean. 
 * @author John Farrar (johnfarrar@sosensible.com) 
 * @version 1, May 30, 2010 
 */
function isORM(item) {
	var metaItem = {};
	try {
		if(isArray(arguments.item) && arrayLen(arguments.item)){
			metaItem = getMetadata(arguments.item[1]);
		} else {
			metaItem = getMetadata(arguments.item);
		}
		if(structKeyExists(metaItem,'persistent') && metaItem.persistent){
			return true;
		} else {
			return false;
		}
	} catch(any e) {
		return false;
	}
}
</cfscript>