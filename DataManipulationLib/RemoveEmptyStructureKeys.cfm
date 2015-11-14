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
 * Removes any empty structure keys from within a structure.
 * version 2 by Raymond Camden, added var, slimmed things down a bit.
 * 
 * @param structure 	 Structure to modify. (Required)
 * @return Returns a structure. 
 * @author Brian Rinaldi (brinaldi@criticaldigital.com) 
 * @version 1, April 19, 2004 
 */
function removeEmptyStructureKeys(structure) {
	var newStructure = structNew();
	var keys = structKeyList(arguments.structure);
	var name = "";
	var i = 1;
	for (;i lte listLen(keys);i=i+1) {
		name = listGetAt(keys,i);
		if (not isSimpleValue(arguments.structure[name])) {
			newStructure[name] = arguments.structure[name];
		}
		else if (arguments.structure[name] neq "") {
			newStructure[name] = arguments.structure[name];
		}
	}
	return newStructure;
}
</cfscript>