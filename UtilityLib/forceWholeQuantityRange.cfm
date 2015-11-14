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
 * Force a value to whole quantity and restrict to a given min/max range.
 * 
 * @param argNum 	 The number to check. (Required)
 * @param argMin 	 The minimum value of the range. (Required)
 * @param argMax 	 The maximum value of the range. (Optional)
 * @return Returns a number. 
 * @author Shawn Fairweather (psalm_119_@hotmail.com) 
 * @version 1, September 27, 2004 
 */
function forceWholeQuantityRange(argNum, argMin){
	var qnty = argNum;

	if(IsNumeric(argNum)){
		qnty = int(argNum);
	} else {
		qnty = argMin;
	}

	if(argNum LT argMin){
		qnty = argMin;
	} else if((arrayLen(arguments) gt 2) and (argNum GT arguments[3])){
		qnty = arguments[3];						
	}
	return qnty;
}
</cfscript>