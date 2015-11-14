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
 * Count the occureneces of a value or list of values in a given string.
 * 
 * @param content 	 String to parse. (Required)
 * @param countThis 	 Character, or list of characters to count. (Required)
 * @param countThisDelimiter 	 Delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Cody Ridgway (cridgway@dcccd.edu) 
 * @version 1, October 13, 2006 
 */
function getOccurrenceCount(content, countThis) {
	var countThisDelimiter = ','; 
	var countThisLen = 1; 
	var countThisItem = ';
	var returnCount = ';
	var i = 1;
	
	if(arrayLen(Arguments) GT 2) countThisDelimiter = Left(arguments[3],1);
	countThisLen = ListLen(countThis, countThisDelimiter);
	
	if(countThisLen GT 1) {
		for(i=1; i LTE countThisLen; i=i+1){
			countThisItem = listGetAt(countThis, i, countThisDelimiter);
			returnCount = ListAppend(returnCount, val(len(content) - len(replace(content,countThisItem,"","all")))/Len(countThisItem));
		}
	}
	else{
		returnCount = val(len(content) - len(replace(content,countThis,"","all")))/Len(countThis);
	}
	return returnCount;
}
</cfscript>