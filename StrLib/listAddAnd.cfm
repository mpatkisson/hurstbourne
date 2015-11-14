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
 * Returns a list as an &quot;English language&quot; list.
 * 
 * @param list 	 List to format. (Required)
 * @param delimiter 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Deanna Schneider (deanna.schneider@ces.uwex.edu) 
 * @version 2, July 7, 2003 
 */
function listAddAnd(list) {
  var i = 1;
  var delimiter = ',';
  var returnValue = '';
  if(ArrayLen(arguments) GTE 2)
    delimiter = arguments[2];
  list = ListToArray(list, delimiter);
  if(arrayLen(list) eq 1) return list[1];
  if(arrayLen(list) eq 2) return list[1] & ' and ' & list[2];

  for(i = 1; i LTE ArrayLen(list); i = i + 1)
  if (i LTE (Arraylen(list) - 1)) returnValue = returnValue & list[i] & ', ';
  else returnValue = returnValue &   ' and ' & list[i];
  return returnValue;
}
</cfscript>