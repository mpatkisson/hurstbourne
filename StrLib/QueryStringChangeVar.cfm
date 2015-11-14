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
 * Changes a var in a query string.
 * 
 * @param name 	 The name of the name/value pair you want to modify. (Required)
 * @param value 	 The new value for the name/value pair you want to modify. (Required)
 * @param qs 	 Query string to modify. Defaults to CGI.QUERY_STRING. (Optional)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 2, September 5, 2002 
 */
function QueryStringChangeVar(variable,value){
	//var to hold the final string
	var string = "";
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var ii = 1;
	var thisVar = "";
	var thisIndex = "";
	var array = "";
	var changedIt = 0;
	//if there is a third argument, use that as the query string, otherwise default to cgi.query_string
	var qs = cgi.query_string;
	if(arrayLen(arguments) GT 2)
		qs = arguments[3];

	//put the query string into an array for easier looping
	array = listToArray(qs,"&");
	//now, loop over the array and rebuild the string
	for(ii = 1; ii lte arrayLen(array); ii = ii + 1){
		thisIndex = array[ii];
		thisVar = listFirst(thisIndex,"=");
		//if this is the var, edit it to the value, otherwise, just append
		if(thisVar is variable){
			string = listAppend(string,thisVar & "=" & value,"&");
			changedIt = 1;
		}
		else{
			string = listAppend(string,thisIndex,"&");
		}
	}
	//if it was not changed, add it!
	if(NOT changedIt)
		string = listAppend(string,variable & "=" & value,"&");
	//return the string
	return string;
}
</cfscript>