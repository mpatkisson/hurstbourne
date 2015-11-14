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
 * Removes null entries from lists.
 * 
 * @param list 	 List to parse. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Craig Fisher (craig@altainteractive.com) 
 * @version 1, May 26, 2003 
 */
function ListRemoveNulls(list) {
  var delim = ",";
       
  if(arrayLen(arguments) gt 1) delim = arguments[2];
  while (Find(delim & delim, list) GT 0){
      list = replace(list, delim & delim, delim, "ALL");
  }
  
  if (left(list, 1) eq delim) list = right(list, Len(list) - 1);
  if (right(list, 1) eq delim) list = Left(list, Len(list) - 1);
  return list;
}
</cfscript>