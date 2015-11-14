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
 * Case-sensitive function for removing duplicate entries in a list.
 * Based on dedupe by Raymond Camden
 * 
 * @param list 	 The list to be modified. (Required)
 * @return Returns a list. 
 * @author Jeff Howden (cflib@jeffhowden.com) 
 * @version 1, July 2, 2008 
 */
function ListDeleteDuplicates(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  for(i = 1; i LTE ArrayLen(list); i = i + 1)
    if(NOT ListFind(returnValue, list[i], delimiter))
      returnValue = ListAppend(returnValue, list[i], delimiter);
  return returnValue;
}
</cfscript>