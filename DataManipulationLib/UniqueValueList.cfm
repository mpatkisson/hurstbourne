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
 * Returns a list of unique values from a query column.
 * 
 * @param queryname 	 Query to scan. (Required)
 * @param columnname 	 Column to use. (Required)
 * @param cs 	 If true, the unique list will check the case of the values. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author Nick Giovanni (ngiovanni@gmail.com) 
 * @version 1, March 27, 2007 
 */
function uniqueValueList(queryName, columnName) {
	var cs = 0; 
	var curRow = 1;
	var uniqueList = "";  
	
	if(arrayLen(arguments) GTE 3 AND isBoolean(arguments[3])) cs = arguments[3]; 
	
	for(; curRow LTE queryName.recordCount; curRow = curRow +1){
		if((not cs AND not listFindNoCase(uniqueList, trim(queryName[columnName][curRow]))) OR (cs AND not listFind(uniqueList, trim(queryName[columnName][curRow])))){
			uniqueList = ListAppend(uniqueList, trim(queryName[columnName][curRow]));
		}
	}
	return uniqueList; 
}
</cfscript>