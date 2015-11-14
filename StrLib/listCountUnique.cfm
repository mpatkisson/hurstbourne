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
 * Count unique items in a list. (Case-sensitive)
 * 
 * @param lst 	 List to parse. (Required)
 * @return Returns a number. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1, November 14, 2007 
 */
function listCountUnique(lst) {
  var i         = 0;
  var delim     = ",";
  var countList = "";
  var lstArray  = "";

  if (arrayLen(arguments) gt 1) delim = arguments[2];
	
  lstArray = listToArray(lst,delim);
	
  for (i = 1; i LTE arrayLen(lstArray); i = i + 1) {
    if (listFind(countList,lstArray[i],delim) eq 0) {
      countList=listAppend(countList,lstArray[i]);
    }
  }

  return listLen(countList);
}
</cfscript>