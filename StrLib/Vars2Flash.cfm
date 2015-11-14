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
 * Converts a list of variable names to a Flash safe string to pass into a Flash movie.
 * 
 * @param varList 	 A list of variable names, not the values themselves. (Required)
 * @param loadVar 	 A variable to append to tell Flash the variables are loaded. (Required)
 * @param delim 	 Optional delimiter. Defaults to a comma. (Optional)
 * @return Returns a Flash safe string. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function vars2Flash(varList,loadVar){
	var i=1;
	var argc = ArrayLen(arguments);
	var outputString="";
        var delim = "";

	if (argc EQ 2) {
		ArrayAppend(arguments,',');
	}
	delim = arguments[3];
	for(i=1;i lte ListLen(varList);i=i+1){
		outputString="#outputString#&#ListGetAt(varList,i,delim)#=#evaluate(ListGetAt(varList,i,delim))#";
	}
	return "#outputstring#&#loadVar#=yes";
}
</cfscript>