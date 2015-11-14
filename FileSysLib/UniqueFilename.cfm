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
 * Creates a unique filename from a passed prefix, file extension and current date/time.
 * Modified by RCamden, changed hh to HH, thanks to Nathan D. for idea.
 * 
 * @param prepend 	 Prefix for the filename. (Required)
 * @param ext 	 Extension to give the file. (Required)
 * @return Returns a string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 2, September 20, 2004 
 */
function uniquefilename(prepend,ext)
{
  Return "#prepend#_#dateformat(now(),"mmddyy")#_#timeformat(now(),"HHmmss")#.#ext#";
}
</cfscript>