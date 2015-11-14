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
 * Dumps out variables/structs in simple text format.
 * Original version used evaluate, so I modified it to require a real var passed in. (ray@camdenfamily.com)
 * 
 * @param variable 	 Variable to dump. (Required)
 * @return Returns nothing, but outputs directly to screen. 
 * @author Doug Gibson (email@dgibson.net) 
 * @version 2, August 22, 2007 
 */
function dumpVarList(variable) { 
	
	// ASSIGN THE delim
	var delim="#Chr(13)##Chr(10)#";
	var var2dump=arguments.variable;
	var label = "";
	var newdump="";
	var keyName="";
	var loopcount=0;
	
	if(arrayLen(arguments) gte 2) delim=arguments[2];
	if(arrayLen(arguments) gte 3) label=arguments[3];
	
	// THE VARIABLE IS A SIMPLE VALUE, SO OUTPUT IT
	if(isSimpleValue(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = " & variable & delim);
		else writeOutput(variable & delim);
	} else if(isArray(var2dump)){
		if(label neq "") writeOutput(uCase(label) & " = [Array]" & delim);
		else writeOutput("[Array]" & delim);
		for(loopcount=1; loopcount lte arrayLen(var2dump); loopCount=loopcount+1) {
	 		if(isSimpleValue(var2dump[loopcount])) writeOutput("[" & loopcount & "] = " & var2dump[loopcount] & delim);
			else DumpVarList(var2dump[loopcount],delim,label);
		}
	}
		// THE VARIABLE IS A STRUCT, SO LOOP OVER IT AND OUTPUT ITS KEY VALUES
	else if(isStruct(var2dump)) {
		if(label neq "") writeOutput(uCase(label) & " = [Struct]" & delim);
		else writeOutput("[Struct]" & delim);
		for(keyName in var2dump) {
			if(isSimpleValue(var2dump[keyName])) {
				if(label neq "") writeOutput(uCase(label) & "." & uCase(keyname) & " = " & var2dump[keyName] & delim);
				else writeOutput(uCase(keyname) & " = " & var2dump[keyName] & delim);
			}
			else dumpVarList(var2dump[keyName],delim,keyname);
		}
	}
		// THE VARIABLE EXISTS, BUT IS NOT A TYPE WE WISH TO DUMP OUT
	else {
		if(label neq "") writeOutput(uCase(label) & " = [Unsupported type]" & delim);
		else writeOutput("[Unsupported type]" & delim);
	}

	return;
}
</cfscript>