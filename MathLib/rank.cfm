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
 * Ranks a number within a set.
 * 
 * @param value 	 Value to rank. (Required)
 * @param set 	 List of numbers. (Required)
 * @return Returns a number. 
 * @author Scott Fitchet (scott@figital.com) 
 * @version 1, December 4, 2008 
 */
function rank(value, set) {

	// Assume the value is in first place
	var ranking = 1;
	var i = 1;

	// Loop over each value in the set
	for (i = 1; i lte listlen(set); i=i+1 ) {
		// If this value in the set is greater, decrease the ordinal
		if ( listgetat(set, i) gt value ) ranking=ranking+1;
	}
	
	return ranking;
}
</cfscript>