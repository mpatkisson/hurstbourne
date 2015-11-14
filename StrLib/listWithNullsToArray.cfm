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
 * Return an array from a list with null values.
 * v2 mod by Marc, fixes a list with a null in front
 * 
 * @param parsedList 	 List to parse. (Required)
 * @param delim 	 List delimeter. Defaults to a comma. (Optional)
 * @return Returns an array. 
 * @author Andy Jarrett (udf@thebluefrogcompany.net) 
 * @version 2, July 20, 2009 
 */
function listWithNullsToArray(parsedList) {
	var delim = ",";
	if((left(trim(parsedList),1)) EQ delim) parsedList = "null" & parsedList;
	if(arrayLen(arguments) gt 1) delim = arguments[2];
	while(find(delim&delim,parsedList)) parsedList = replace(parsedList,delim&delim,delim & "NULL" & delim,"ALL");
	if(right(parsedList,1) eq delim){
		parsedList = listAppend(parsedList,"NULL",delim);
	}
	return listToArray(parsedList,delim);
}
</cfscript>