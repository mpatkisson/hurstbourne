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
 * Returns the passed string with all non-numbers removed (letters, punctuation, whitespace, etc.).
 * 
 * @param textStr 	 String containing numbers you want returned. 
 * @param allowDec 	 Boolean (yes/no) indicating whether to preserve decimal points.  Default is No. 
 * @return Returns a number. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, December 18, 2001 
 */
function GetNumbers(textstr) {
  if (arraylen(arguments) GTE 2) { 
    return REReplace(textstr,"[^0-9\.]",'','ALL'); }
  else { 
    return REReplace(textstr,"[^0-9]",'','ALL');  }
}
</cfscript>