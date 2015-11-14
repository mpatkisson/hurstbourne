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
 * Converts a given number of days, hours, minutes, OR seconds to a struct of days, hours, minutes, AND seconds.
 * 
 * @param timespan 	 The timespan to convert. 
 * @return Returns a structure. 
 * @author Dave Pomerance (dpomerance@mos.org) 
 * @version 1, January 7, 2002 
 */
function CreateTimeStruct(timespan) {
    var timestruct = StructNew();
    var mask = "s";

    if (ArrayLen(Arguments) gte 2) mask = Arguments[2];

	// if timespan isn't an integer, convert mask towards s until timespan is an integer or mask is s
	while (Int(timespan) neq timespan AND mask neq "s") {
		if (mask eq "d") {
			timespan = timespan * 24;
			mask = "h";
		} else if (mask eq "h") {
			timespan = timespan * 60;
			mask = "m";
		} else if (mask eq "m") {
			timespan = timespan * 60;
			mask = "s";
		}
	}
	
	// only 4 allowed values for mask - if not one of those, return blank struct
	if (ListFind("d,h,m,s", mask)) {
		// compute seconds
		if (mask eq "s") {
			timestruct.s = (timespan mod 60) + (timespan - Int(timespan));
			timespan = int(timespan/60);
			mask = "m";
		} else timestruct.s = 0;
		// compute minutes
		if (mask eq "m") {
			timestruct.m = timespan mod 60;
			timespan = int(timespan/60);
			mask = "h";
		} else timestruct.m = 0;
		// compute hours, days
		if (mask eq "h") {
			timestruct.h = timespan mod 24;
			timestruct.d = int(timespan/24);
		} else {
			timestruct.h = 0;
			timestruct.d = timespan;
		}
	}
	
	return timestruct;
}
</cfscript>