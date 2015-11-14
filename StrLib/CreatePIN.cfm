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
 * Flexible PIN generator, supporting alphabetical, numeric, and alphanumeric types, upper, lower, and mixed cases, and validating prescence of letters and numbers in alphanumeric PINs at least 2 characters long.
 * 
 * @param chars 	 Number of characters to return. (Required)
 * @param type 	 Type of PIN to create. Types are: n (numeric), a (alphabetical), m (mixed, or alphanumeric). Default is m. (Optional)
 * @param format 	 Case of PIN. Options are: u (uppercase), l (lowercase), m (mixed). Default is m. (Optional)
 * @return Returns a string. 
 * @author Sierra Bufe (sierra@brighterfusion.com) 
 * @version 1, May 14, 2002 
 */
function createPIN(chars){
	var type    = "m";
	var format  = "m";
	var PIN     = "";
	var isValid = false;
	var i       = 0;
	var j       = 0;
	var r	    = 0;
	
	// Check to see if type was provided.  If not, default to "m" (mixed, or alphanumeric).
	if (ArrayLen(Arguments) GT 1) {
		type = Arguments[2];
		if (type is "alphanumeric")
			type = "m";
		type = left(type,1);
		if ("a,n,m" does not contain type)
			return "Invalid type argument.  Valid types are:  alpha, numeric, alphanumeric, mixed, a, n, m.  This argument is optional, and defaults to alphanumeric";
	}
	
	// Check to see if format was provided.  If not, default to "m" (mixed upper and lower).
	if (ArrayLen(Arguments) GT 2) {
		format = Arguments[3];
		format = left(format,1);
		if ("u,l,m" does not contain format)
			return "Invalid format argument.  Valid formats are:  upper, lower, mixed, u, l, m.";
	}
	
	// if type is alphanumeric, set j to 10 to allow for numbers in the RandRange
	if (type is "m")
		j = 10;
	
	while (not isValid) {
	
		PIN = "";
		
		// loop through each character of the PIN
		for (i = 1; i LTE chars; i = i+1) {
		
			// numeric type
			if (type is "n") {
				r = RandRange(0,9) + 48;
			
			// lowercase format
			} else if (format is "l") {
				r = RandRange(97,122 + j);
				if (r GTE 123)
					r = r - 123 + 48;
			
			// uppercase format
			} else if (format is "u") {
				r = RandRange(65,90 + j);
				if (r GTE 91)
					r = r - 91 + 48;
			
			// upper and lower cases mixed
			} else if (format is "m") {
				r = RandRange(65,116 + j);
				if (r GTE 117)
					r = r - 117 + 48;
				else if (r GTE 91)
					r = r + 6;
			
			}
			
			PIN = PIN & Chr(r);
		}
		
		// verfify that alphanumeric strings contain both letters and numbers
		if (type is "m" AND chars GTE 2) {
			if (REFind("[A-Z,a-z]+",PIN) AND REFind("[0-9]+",PIN))
				isValid = true;
		} else {
			isValid = true;
		}
	
	}
		
	return PIN;
}
</cfscript>