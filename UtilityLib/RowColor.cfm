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
 * Returns alternating color based on list of colors.
 * 
 * @param colorList 	 List of colors. (Required)
 * @param currentRow 	 Current row number. (Required)
 * @param delimiter 	 List delimiter for colorList. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Al Everett (everett.al@gmail.com) 
 * @version 1, December 21, 2011 
 */
function rowColor(colorList,currentRow) {
	var delimiter=",";
	var rowColor="";
	var colorIndex=1;

	if (ArrayLen(arguments) GT 2) delimiter = arguments[3];
	
	colorIndex=currentRow MOD ListLen(colorList,delimiter) + 1;
	
	rowColor=ListGetAt(colorList,colorIndex,delimiter);
	
	return rowColor;
}
</cfscript>