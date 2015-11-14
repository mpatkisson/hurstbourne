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
 * Format a range of dates (&quot;August 3 - 11, 2003&quot;).
 * Small bug in last statement was losing end date. RKC
 * 
 * @param startDate 	 Initial date. Defaults to now. (Optional)
 * @param endDate 	 Ending date. Defaults to now. (Optional)
 * @param format 	 Either "long" or "short". Defaults to long. (Optional)
 * @return Returns a string. 
 * @author Bryan Buchs (bbuchs@mac.com) 
 * @version 1, June 8, 2004 
 */
function DateRangeFormat() {
	var format = "long";
	var longformat = "mmmm d, yyyy";
	var shortformat = "m/d/yy";
	var applyformat = longformat;
	var startDate = now();
	var endDate = now();
	var startFormat = DateFormat(startDate,format);
	var endFormat = DateFormat(endDate,format);
	var DateRangeFormat = startFormat;
	
	if (arrayLen(arguments) GTE 1) { startDate = arguments[1]; }
	if (arrayLen(arguments) GTE 2) { endDate = arguments[2]; }
	if (arrayLen(arguments) GTE 3) { format = arguments[3]; }
	
	if(format is not "long" and format is not "short") format = "long";
	if(format is not "long") applyformat = shortformat;
	
	//case one, same month and year
	if(year(startDate) is year(endDate) and month(startDate) is month(endDate)) {
		startFormat = dateFormat(startDate,ReplaceNoCase(applyformat,"y","","All"));
		if(format is "long") {
			endFormat = dateFormat(endDate,ReplaceNoCase(applyformat,"m","","All"));
		} else {
			endFormat = dateFormat(endDate,applyformat);
		}
	} else if(year(startDate) is year(endDate)) {
	//case two, same year
		startFormat = DateFormat(startDate,ReplaceNoCase(applyformat,"y","","All"));
		endFormat = DateFormat(endDate,applyformat);
	} else {
	//case three, different year and month, dont change anything
		startFormat = DateFormat(startDate,applyformat);
		endFormat = DateFormat(endDate,applyformat);
	}

	if (right(trim(startFormat),1) EQ "," or right(trim(startFormat),1) EQ "/") { 
		startFormat = trim(RemoveChars(startFormat,len(trim(startFormat)), 1)); 
	}

	if (arrayLen(arguments) GTE 2 AND startDate NEQ endDate) {
		DateRangeFormat = startFormat & " - " & endFormat;
	} else {
		DateRangeFormat = dateFormat(startDate,applyformat);
	}
	
	return trim(DateRangeFormat);
}
</cfscript>