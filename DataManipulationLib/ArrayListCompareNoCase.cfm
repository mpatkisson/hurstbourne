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
 * Returns the index of the first item in an array that contains a list element.
 * 
 * @param arrayToSearch 	 The array to search. (Required)
 * @param listToFind 	 List that will be searched for. If any item is found, the array index is returned. (Required)
 * @param delimiter 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author Steve Robison, Jr (steverobison@gmail.com) 
 * @version 1, March 28, 2005 
 */
function ArrayListCompareNoCase(arrayToSearch,listToFind){
	//a variable for looping
	var ii = 0;		// variable for looping through list
	var jj = 0;		// variable for looping through array
	var delimiter = ',';		// default delimiter
	

	// check to see if delimiters were passed
	if (ArrayLen(arguments) gt 2) delimiter = arguments[3];

	//loop through list
	for(ii = 1; ii LTE ListLen(listToFind, delimiter); ii = ii + 1) {
	//loop through the array, looking for the value
	for(jj = 1; jj LTE arrayLen(arrayToSearch); jj = jj + 1){
		//if this is the value, return the index
		if(NOT compareNoCase(arrayToSearch[jj],ListGetAt(listToFind, ii, delimiter)))
			return jj;
	}
	}
	//if we've gotten this far, it means the value was not found, so return 0
	return 0;
}
</cfscript>