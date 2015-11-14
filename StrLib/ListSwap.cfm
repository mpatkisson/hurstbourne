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
 * Swaps two elements in a list.
 * 
 * @param list 	 The list to modify. (Required)
 * @param positionA 	 The first position to swap. (Required)
 * @param positionB 	 The second position to swap. (Required)
 * @param delims 	 The delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Rob Baxter (rob@microjuris.com) 
 * @version 1, June 21, 2002 
 */
function ListSwap(list, PositionA, PositionB)
{
	var elementA = "";
	var elementB = "";
	var Delims = ",";

	if (ArrayLen(Arguments) gt 3)
		Delims = Arguments[4];
			
	if (PositionA gt ListLen(list) Or PositionB gt ListLen(list) Or PositionA lt 1 or PositionB lt 1)
		return list;	
	
	elementA = ListGetAt(list, PositionA, Delims);
	elementB = ListGetAt(list, PositionB, Delims);
	
	//do the swap
	list = ListSetAt(list, PositionA, elementB, Delims);
	list = ListSetAt(list, PositionB, elementA, Delims); 

	return list;
}
</cfscript>