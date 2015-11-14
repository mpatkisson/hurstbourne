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
 * Complex variable checking with a single function call.
 * Version 2 by Michael Wolfe, mikey@mikeycentral.com. Returns false earlier.
 * 
 * @param assertion 	 Assertion rule string you want to validate against.  Variable names should be delimited by the pipe (|). (Required)
 * @return Returns a Boolean value. 
 * @author Dean Chalk (dchalk99@hotmail.com) 
 * @version 2, September 23, 2004 
 */
function assert(assertion) {
	var result = 1;
	var loopvar1 = 0;
	var loopvar2 = 0;
	var variableassertion = "";
	var varsection = "";
	var varname = "";
	var varalias = "";
	var assertionsection = "";
	var anassertion = "";
	var assertnow = "";
	var doBreak = false;
	
	for(loopvar1 = 1; loopvar1 LTE listlen(assertion, "!"); loopvar1 = incrementvalue(loopvar1)) {
		variableassertion = listgetat(assertion, loopvar1, "!");
		varsection = trim(gettoken(variableassertion, 1, ":"));
		varname = trim(listfirst(varsection, " "));
		varalias = trim(listlast(varsection, " "));
		assertionsection = trim(gettoken(variableassertion, 2, ":"));
		
		for(loopvar2 = 1; loopvar2 LTE listlen(assertionsection, ";"); loopvar2 = incrementvalue(loopvar2)) {
			anassertion = listgetat(assertionsection, loopvar2, ";");
			
			if(not isdefined(varname)){
				result = 0;
				doBreak = true;
				break;
			} else {
				assertnow = replacenocase(anassertion, "|#varalias#|", varname, "ALL");
				
				if(not(evaluate(trim(assertnow)))){
					result = 0;
					doBreak = true;
					break;
				}
			}
		}
		
		if(doBreak){
			break;
		}
	}
	
	return result;
}
</cfscript>