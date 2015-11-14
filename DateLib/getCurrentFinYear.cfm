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
 * Returns the current two-part financial year in a specified format.
 * 
 * @param mask 	 Formats result using y1 and y2. (Required)
 * @param date 	 Date to use. Defaults to now(). (Optional)
 * @return Returns a string. 
 * @author Toby Tremayne (toby@lyricist.com.au) 
 * @version 1, May 26, 2003 
 */
function getCurrentFinYear(mask) {
 	var finYear = "";
	var partOne = "";
	var partTwo = "";
	var date = now();

	if(arrayLen(arguments) gte 2) date = arguments[2];
	
	// if the current month falls in the first 6 months of the year...
	if (month(date) lte 6) {
		// first part is last year
		partOne = year(dateAdd("yyyy", -1, date));
		// second part is this year
		partTwo = year(date);
	} else {
		// first part is this year
		partOne = year(date);
		// second part is next year
		partTwo = year( dateAdd("yyyy", 1, date) );
	}
	// replace mask tokens for return
	finYear = replaceNoCase(mask,"y1",partOne);
	finYear = replaceNoCase(finYear,"y2",partTwo);
	
	return finYear;
}
</cfscript>