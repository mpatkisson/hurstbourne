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
 * Toggles a value (ie: &quot;stop&quot;/&quot;start&quot;) between two options.
 * 
 * @param variable 	 The variable that stores the value you will toggle. (Required)
 * @param value1 	 The first value of the toggle. (Required)
 * @param value2 	 The second value of the toggle. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 3, 2002 
 */
function toggleValue(variable,value1,value2){
	//make a struct in which the value is the opposite of the key
	var toggler = structNew();
	toggler[value1] = value2;
	toggler[value2] = value1;
	//return whichever value is not the current value
	return toggler[variable];
}
</cfscript>