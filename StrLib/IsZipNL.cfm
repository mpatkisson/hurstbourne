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
 * Tests passed value to see if it is a properly formatted Dutch zip code.
 * Thanks to Jeff Guillaume on who's UDF IsZip I based this UDF.
 * Version 2 by pjf@maestropublishing.com
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a Boolean value. 
 * @author Martijn Verhoeven (MVerhoeven@Rhinofly.nl) 
 * @version 2, July 15, 2005 
 */
function IsZipNL(str) {
    /* All dutch zip codes contains four numbers and two letters  (NNNN AA) with an optional space for the regex. */
    /* Zips start at 1000 so if the first number is a 0 the zip is wrong. */
    return REFind("^[1-9][[:digit:]]{3}( )?[[:alpha:]]{2}$", arguments.str);
}
</cfscript>