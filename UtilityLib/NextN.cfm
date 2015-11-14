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
 * Enables next 'n' browsing of a record set.
 * Modified by Ray Camden to: Make the url var dynamic, and disable the link on current page.
 * 
 * @param count 	 The record count of the query. (Required)
 * @param numToDiplay 	 How many records are displayed per page. (Required)
 * @param href 	 The URL to link to. This can include query string information. (Required)
 * @param startMarker 	 The name of the url variable that will signify which record to start with. Defaults to "nextStart." (Optional)
 * @return Returns a string. 
 * @author Joel Richards (joel@brainstormin.net) 
 * @version 2, October 10, 2002 
 */
function nextN(count,numToDisplay,href) {
	var totalRecords = count; // query recordcount
	var NsListLength = ceiling(totalRecords / numToDisplay); // this will give us the number of pages needed to display the full record set
	var NextStartList = ""; // list of start numbers
	var nextStart=1; // where to start outputting record
	var content = "";
	var i = 1;
	var startMarker = "nextStart"; // name of the url var to create
	
	if(arrayLen(arguments) gte 4) startMarker = arguments[4];
	
	for ( i = 1; i lte NsListLength; i = i + 1 ) {
		NextStartlist = listAppend(NextStartlist,nextStart); 
		// this will be the next start number in our list
		nextStart = nextStart + numToDisplay;
	}

	//output the links
	if (len(NextStartList) gt 1) {
		content = "Page ";
		for (i = 1; i lte listlen(NextStartList);  i = i + 1) {
			if(isDefined("url.#startMarker#") and url[startMarker] is listGetAt(NextStartList,i)) content = content & i;
			else content = content & " <a href=""" & href & "&#startMarker#=" & listGetAt(NextStartList,i) & """>" & i & "</a> ";
		} 
	}

	return content;
}
</cfscript>