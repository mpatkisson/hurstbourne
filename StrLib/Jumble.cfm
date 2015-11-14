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
 * Takes a string and scrambles the characters.
 * 
 * @param str 	 String you want to jumble. 
 * @return Returns a string. 
 * @author Brad Roberts (broberts@nxs.net) 
 * @version 1, December 16, 2001 
 */
function jumble(str) {
  var tempstring=""; 
  var temp=0;
  while (len(str) gt 0) {
    temp = randrange(1, len(str));
    tempstring = tempstring & mid(str, temp, 1);
    str = removechars(str, temp, 1);
  }
  return tempstring;
}
</cfscript>