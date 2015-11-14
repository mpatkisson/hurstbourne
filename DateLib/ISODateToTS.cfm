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
 * Converts text string of ISO Date to datetime object; useful for parsing RSS and RDF.
 * * version 1.0 by James Edmunds
 * * version 2.0 by Adam Reynolds (added support for TZ offsets)
 * * version 2.1 by Adam Cameron (merged James's and AdamR's versions &amp; fixed bug with offsets that had a minute component to them)
 * 
 * @param str 	 ISO datetime string to parse. (Required)
 * @return Returns a datetime 
 * @author James Edmunds (jamesedmunds@jamesedmunds.com) 
 * @version 2, October 22, 2012 
 */
function ISODateToTS(str) {
	// time formats have 2 ways of showing themselves: 1994-11-05T13:15:30Z UTC format OR 1994-11-05T08:15:30-05:00
	var initialDate		= parseDateTime(REReplace(arguments.str, "(\d{4})-?(\d{2})-?(\d{2})T([\d:]+).*", "\1-\2-\3 \4"));
	var timeModifier	= "";
	var multiplier		= 0;

	// If not in UTC format then we need to offset the time
	if (right(arguments.str, 1) neq "Z") {
		//Now we determine if we are adding or deleting the the time modifier.
		if (arguments.str contains '+' and listlen(listrest(arguments.str, "+"), ":") eq 2){
			timeModifier = listRest(arguments.str,"+");
			multiplier = 1; // Add
		} else if (listlen(listLast(arguments.str,"-"),":") eq 2) {
			timeModifier = listLast(arguments.str,"-");
			multiplier = -1; // Delete
		}
		if (len(timeModifier)){
			initialDate = dateAdd("h", val(listFirst(timeModifier, ":"))*multiplier, initialDate);
			initialDate =  dateAdd("n", val(listLast(timeModifier, ":"))*multiplier, initialDate);
		}
	}
	return initialDate;
}
</cfscript>