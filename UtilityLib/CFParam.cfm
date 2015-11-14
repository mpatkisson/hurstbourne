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
 * Function to duplicate the <cfparam> tag within CFSCRIPT.
 * Rewritten by RCamden
 * V2 mods by John Farrar
 * 
 * @param varname 	 The name of the variable. 
 * @param value 	 The default value. If not passed, use  
 * @return Returns the value of the variable parammed. 
 * @author Fred T. Sanders (fred@fredsanders.com) 
 * @version 2, November 13, 2001 
 */
function cfparam(varname) {
	var value = "";
	
	if(arrayLen(Arguments) gt 1) value = Arguments[2];
	if(not isDefined(varname)) setVariable(varname,value);
        return evaluate(varname);
}
</cfscript>