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
 * Converts a URL query string to a structure.
 * 
 * @param qs 	 Query string to parse. Defaults to cgi.query_string. (Optional)
 * @return Returns a struct. 
 * @author Malessa Brisbane (cflib@brisnicki.com) 
 * @version 1, April 11, 2006 
 */
function queryStringToStruct() {
	//var to hold the final structure
	var struct = StructNew();
	//vars for use in the loop, so we don't have to evaluate lists and arrays more than once
	var i = 1;
	var pairi = "";
	var keyi = "";
	var valuei = "";
	var qsarray = "";
	var qs = CGI.QUERY_STRING; // default querystring value
	
	//if there is a second argument, use that as the query string
	if (arrayLen(arguments) GT 0) qs = arguments[1];

	//put the query string into an array for easier looping
	qsarray = listToArray(qs, "&");
	//now, loop over the array and build the struct
	for (i = 1; i lte arrayLen(qsarray); i = i + 1){
		pairi = qsarray[i]; // current pair
		keyi = listFirst(pairi,"="); // current key
		valuei = urlDecode(listLast(pairi,"="));// current value
		// check if key already added to struct
		if (structKeyExists(struct,keyi)) struct[keyi] = listAppend(struct[keyi],valuei); // add value to list
		else structInsert(struct,keyi,valuei); // add new key/value pair
	}
	// return the struct
	return struct;
}
</cfscript>