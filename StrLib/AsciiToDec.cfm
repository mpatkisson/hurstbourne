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
 * Convert ASCII characters into a decimal number.
 * Removed evaluate
 * 
 * @param string 	 String to format. (Required)
 * @param order 	 Byte order (i for Intel or m for Motorola) (Optional)
 * @param signed 	 Process signed integers normally or in two's complement notation. Values are false (process normally), true (signed), and tcn (2's complement notation) (Optional)
 * @return Returns a string. 
 * @author Evan Keller (coldfusion@evankeller.com) 
 * @version 2, January 2, 2003 
 */
function AsciiToDec(string) {
	var order="i";		//Optional arrtibute: Byte Order
						//"i"= Intel (default)
						//"m"= Motorola
	var signed=false;	//Optional attribute: Signed
						//false= unsigned (default)
						//true= signed
						//"tcn"= 2's Complement Notation
	var result=0;
	var i=0;
	
	if (ArrayLen(arguments) gt 1) {
		order = arguments[2];
	}
	if (ArrayLen(arguments) gt 2) {
		signed = arguments[3];
	}
	for (i=1; i LTE len(string)+1; i=i+1) {
		if (order is "i") {
			result = result + (asc(mid(string, i, 1)) * 256^(i-1));
		}
		if (order is "m") {
			result = result + (asc(mid(string, i, 1)) * 256^(len(string)-i));
		}
	}
	switch (signed) {
		case true:
			if (len(string) is 0) { //If the string is "0" the length is calculated as zero,
									//which throws things off, we set the string to " " so
									//it has a length of one.
				string = " ";
			}
			result = result - 256^len(string)/2;
		case "tcn":
			if (result GTE 256^len(string)/2) {
				result = result - 256^len(string);
			}
		default:
			result = result;
	}
	return result;
}
</cfscript>