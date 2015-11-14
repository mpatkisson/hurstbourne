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
 * Adds all the numbers in a delimited list returning the sum of the list.
 * 
 * @param listStr 	 Delimited list of numeric values you want to sum. 
 * @param delim 	 Optional delimiter for the list.  The default is the comma. 
 * @return Returns a numeric value. 
 * @author Douglas Williams (klenzade@i-55.com) 
 * @version 1.0, September 10, 2001 
 */
function listSum(listStr)
{
  var delim = ",";
  if(ArrayLen(Arguments) GTE 2) 
    delim = Arguments[2];
  return ArraySum(ListToArray(listStr, delim));
}
</cfscript>