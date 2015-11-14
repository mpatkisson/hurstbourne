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
 * This function deletes all client variables for a user.
 * Version 2 mods by Tony Petruzzi
 * 
 * @param safeList 	 A list of client vars to NOT delete. 
 * @return Returns true. 
 * @author Bernd VanSkiver (bernd@shadowdesign.net) 
 * @version 2, January 29, 2002 
 */
function DeleteClientVariables() {
	var ClientVarList = GetClientVariablesList();
	var safeList = "";
	var i = 1;

	if(ArrayLen(Arguments) gte 1) safeList = Arguments[1];

	for(i=1; i lte listLen(ClientVarList); i=i+1) {
		if(NOT ListFindNoCase(safeList, ListGetAt(ClientVarList, i )))  DeleteClientVariable(ListGetAt(ClientVarList, i));
	}
	return true;
}
</cfscript>