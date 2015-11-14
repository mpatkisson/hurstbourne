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
 * Returns the last index of an occurrence of a substring in a string from a specified starting position.
 * Big update by Shawn Seley (shawnse@aol.com) -
 * UDF was not accepting third arg for start pos 
 * and was returning results off by one.
 * Modified by RCamden, added var, fixed bug where if no match it return len of str
 * 
 * @param Substr 	 Substring to look for. 
 * @param String 	 String to search. 
 * @param SPos 	 Starting position. 
 * @return Returns the last position where a match is found, or 0 if no match is found. 
 * @author Charles Naumer (cmn@v-works.com) 
 * @version 2, February 14, 2002 
 */
function RFind(substr,str) {
  var rsubstr  = reverse(substr);
  var rstr     = "";
  var i        = len(str);
  var rcnt     = 0;

  if(arrayLen(arguments) gt 2 and arguments[3] gt 0 and arguments[3] lte len(str)) i = len(str) - arguments[3] + 1;

  rstr = reverse(Right(str, i));
  rcnt = find(rsubstr, rstr);

  if(not rcnt) return 0;
  return len(str)-rcnt-len(substr)+2;
}
</cfscript>