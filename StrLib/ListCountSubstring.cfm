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
 * Counts the number of list elements that contain a given substring.
 * 
 * @param lst 	 List to search. (Required)
 * @param str 	 Substring to search for. (Required)
 * @param delim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a number. 
 * @author John King (arocheking@yahoo.com) 
 * @version 1, June 3, 2003 
 */
function ListCountSubstring(lst, str) {
  var pos = 1;
  var count = 0;
  var newlst = "";
  var delim = ",";

  if(arrayLen(arguments) gte 3) delim = arguments[3];

  newlst = lst; //list to work on
  while(pos neq 0){
    pos = listContainsNoCase(newlst, str, delim);
    if (pos neq 0){ 
      newlst = listDeleteAt(newlst,pos,delim);
      count = count + 1;
    }
  }
  return count;
}
</cfscript>