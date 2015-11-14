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
 * Restores significant trailing zeroes which may have been omitted during calculations.
 * 
 * @param inNum 	 The number. (Required)
 * @param places 	 Number of significant digits. (Required)
 * @return Returns a number. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, September 27, 2002 
 */
function TrailingZeroes(inNum, decPlaces){
	var existing_dec_places  = 0;

	if(decPlaces GT 0) {
		if(inNum contains "."){
			existing_dec_places = Len(ListGetAt(inNum, 2, "."));
			if(existing_dec_places LT decPlaces){
				return inNum & RepeatString("0", decPlaces - existing_dec_places);
			}
		} else {
			// was shortened to an integer without a decimal point
			return inNum & "." & RepeatString("0", decPlaces - existing_dec_places);
		}
	}
	return inNum;
}
</cfscript>