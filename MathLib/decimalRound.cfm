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
 * Rounds a number to a specific number of decimal places by using Java's math library.
 * 
 * @param numberToRound 	 The number to round. (Required)
 * @param numberOfPlaces 	 The number of decimal places. (Required)
 * @param mode 	 The rounding mode. Defaults to even. (Optional)
 * @return Returns a number. 
 * @author Peter J. Farrell (pjf@maestropublishing.com) 
 * @version 1, March 3, 2006 
 */
function decimalRound(numberToRound, numberOfPlaces) {
	// Thanks to the blog of Christian Cantrell for this one
	var bd = CreateObject("java", "java.math.BigDecimal");
	var mode = "even";
	var result = "";
	
	if (ArrayLen(arguments) GTE 3) {
		mode = arguments[3];
	}

	bd.init(arguments.numberToRound);
	if (mode IS "up") {
		bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_UP);
	} else if (mode IS "down") {
		bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_DOWN);
	} else {
		bd = bd.setScale(arguments.numberOfPlaces, bd.ROUND_HALF_EVEN);
	}
	result = bd.toString();
	
	if(result EQ 0) result = 0;

	return result;
}
</cfscript>