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
 * Creates a base 36 from numbers that don't fit inside an integer.
 * 
 * @param num 	 Number to convert. (Required)
 * @return Returns a string. 
 * @author David Edgar (appsupport@hotmail.com) 
 * @version 0, June 11, 2009 
 */
function nBase36(num){
	var stream = chr(32);
	var chars = "0123456789abcdefghijklmnopqrstuvwxyz";
	var res = "";
	if (num GT 0) { 
		while (num GT 0) {
			res = num - 36 * int(num / 36);
			num = int(num / 36);
			stream = mid(chars,res + 1,1) & stream;
		}
	} else {
		stream = num;
	}
	return(stream);
}
</cfscript>