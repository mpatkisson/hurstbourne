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
 * Implementation of Luhn algorithm or Mod10.
 * v2 fix by Mike Causer
 * 
 * @param number 	 Value to format. (Required)
 * @return Returns a number. 
 * @author Lucas Sherwood (lucas@thebitbucket.net) 
 * @version 2, September 9, 2009 
 */
function createMod10(number) {
	// this function generates the check digit and appends it to the orignal string
	var nDigits = len(arguments.number);
	var sum = 0;
	var i=0;
	var digit = "";
	var checkdigit = 0;
	for (i=0; i LT nDigits; i=i+1) {
		digit = mid(arguments.number, nDigits-i, 1);
		if(NOT (i MOD 2)) {
			digit = digit+digit;
			// check to see if we should add
			if(len(digit) gt 1) {
				digit = left(digit,1) + right(digit,1);
			}
		}
		checkdigit = checkdigit + digit;
	}
	// divid by 10 and subtract from 10
	checkdigit = 10 - (checkdigit mod 10);
	return arguments.number & right( checkdigit, 1 );
}
</cfscript>