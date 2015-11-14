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
 * Examine the contents of a BINARY file.
 * 
 * @param BVar 	 Binary variable. (Required)
 * @param loc 	 Location in the binary file. (Required)
 * @return Returns a string. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, November 15, 2002 
 */
function Get(BVar,loc) {
	if (isBinary(BVar) EQ "No") return 0;
	if (BVar[loc] GTE 0) return BVar[loc];
	return BVar[loc] + 256;
}
</cfscript>