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
 * Checks for a valid file extension.
 * 
 * @param path 	 The file path. 
 * @param extlist 	 The list of valid extensions. 
 * @return Returns a boolean. 
 * @author Gyrus (gyrus23@hotmail.com) 
 * @version 1, December 19, 2001 
 */
function IsExtValid(path,extlist) {
	// Find the last dot
	var DotPos = Find(".", Reverse(path));
	// Grab the extension
	var ext = Right(path, 3);
        return (not ((DotPos NEQ 4) OR (NOT ListFindNoCase(extlist, ext))));
}
</cfscript>