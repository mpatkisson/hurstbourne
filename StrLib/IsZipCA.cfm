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
 * Tests passed value to see if it is a properly formatted Canadian zip code.
 * Peter J. Farrell (pjf@maestropublishing.com) Now checks if 1st digit if the FDA (Foward Delivery Area - 1st three digits of postal code) is one of the current 18 characters used by Canada Post as of April 2004 to signalfy a province or provincial area
 * 
 * @param str 	 String to be checked. (Required)
 * @return Returns a boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 4, July 15, 2005 
 */
function IsZipCA(str) {
 return REFind('^[A-CEG-NPR-TVXYa-ceg-npr-tvxy][[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z]( |-)?[[:digit:]][A-CEG-NPR-TVW-Za-ceg-npr-tvw-z][[:digit:]]$', str);
}
</cfscript>