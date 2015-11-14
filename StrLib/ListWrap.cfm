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
 * Wraps a list every n elements.
 * 
 * @param lst 	 The list to modify. (Required)
 * @param length 	 The place to do insertions. (Required)
 * @param br 	 String to insert. Detauls to a break tag. (Optional)
 * @param delimiter 	 The delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Tony Brandner (brandner@canada.com) 
 * @version 1, May 14, 2002 
 */
function ListWrap(lst, lngth) {
	var newList=lst;
	var br="<br>";
	var delimiter=",";
        var i = lngth;
	// check for optional arguments
	if(ArrayLen(arguments) eq 3) {
		br = arguments[3];
	} else if (ArrayLen(arguments) EQ 4) {
		br = arguments[3];
		delimiter = arguments[4];
	}
	// loop through list
	for (i=lngth; i LE ListLen(lst,delimiter); i=i+lngth) {
		if (ListLen(lst, delimiter) GT i) {
			// append the break string to the next element
			newList = ListSetAt(newList, i+1, br & ListGetAt(lst, i+1, delimiter), delimiter);
		}
	}
	return newList;
}
</cfscript>