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
 * Rounds any real number to a user specified interval.
 * 
 * @param nNumber 	 The number to round. (Required)
 * @param nInterval 	 The number to round to. (Required)
 * @param bOption 	 Used to calculate percentage for rounding. (Optional)
 * @return Returns a number. 
 * @author Rob Rusher (rob@robrusher.com) 
 * @version 1, July 20, 2005 
 */
function intervalRound(nNumber, nInterval){
	var nMultipler = fix(nNumber / nInterval); // How many times does the interval go into intNumber
	var bOption = 0;

	if(arrayLen(arguments) GTE 3 AND arguments[3])
		if(((nNumber mod nInterval) / nInterval) gte .5) bOption = 1; // Calculate percentage for rounding option.

	return (nInterval * nMultipler) + (bOption * nInterval);
}
</cfscript>