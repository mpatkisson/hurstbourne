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
 * Converts decimal to time.
 * 
 * @param decimal 	 A number between 0 and 23.99. (Required)
 * @param timeMask 	 Mask for formatting. Defaults to hh:mm tt. (Optional)
 * @return Returns a string. 
 * @author Nick Giovanni (audi.tt@verizon.net) 
 * @version 1, August 9, 2005 
 */
function decimal2Time(decimal){
	var timeMask = "hh:mm tt"; 
	var timeValue = ""; 
	var decimalMinutes = "";
	var decimalHours = "";

	//make sure passed value is numeric
	if(not isNumeric(decimal)) return "The value passed to function decimalToTime() is not a valid number!";

	timeValue =  numberFormat(decimal,"99.99");
	
	if(timeValue LT 0 OR timeValue GTE 24) return "The value passed to function decimalToTime() is not within the valid range of 0 - 23.99"; 

	//if the optional mask was passed use that otherwise default to "hh:mm tt"
	if(arrayLen(arguments) gt 1) timeMask = arguments[2];
			
	decimalHours = listfirst(timeValue,".");
	decimalMinutes = listLast(timeValue,".");
			
	//attempt to determine minutes 
	if(decimalMinutes neq 0) decimalMinutes = round(60*decimalMinutes/100);
			
	timeValue = timeFormat(decimalHours & ":" & decimalMinutes,timeMask);
	return timeValue;
}
</cfscript>