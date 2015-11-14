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
 * Divide a string in parts of equal size with separators in between/
 * 
 * @param str 	 String to dice (Required)
 * @param size 	 Size of the resulting parts (Required)
 * @param sep 	 Separator between resulting parts (Optional)
 * @return Returns a string. 
 * @author Richard (acdhirr@trilobiet.nl) 
 * @version 1, April 24, 2012 
 */
function dice(str,size) {

	var r = "";
	var i = 0;
	var sep = "<wbr/>";	

	if (arrayLen(arguments) GT 2 ) sep = arguments[3];
	
	for ( i=0; i LT len(str); i=i+1 ) {
		if ( (i-size+1) mod size eq 1) r&=sep; 
		r &= str.charAt(i);
	}	
	
	return trim(r);
}
</cfscript>