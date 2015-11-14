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
 * Reverses a list.
 * Modified by RCamden to use var scope
 * 
 * @param list 	 List to be modified. 
 * @param delimiter 	 Delimiter for the list. Defaults to a comma. 
 * @return Returns a list. 
 * @author Stephen Milligan (spike@spike.org.uk) 
 * @version 2, July 17, 2001 
 */
function ListReverse(list) {

	var newlist = "";
	var i = 0;
	var delims = "";
	var thisindex = "";
	var thisitem = "";
	
	var argc = ArrayLen(arguments);
	if (argc EQ 1) {
		ArrayAppend(arguments,',');
	}
	delims = arguments[2];
	while (i LT listlen(list,delims))
	{	
	thisindex = listlen(list,delims)-i;
	thisitem = listgetat(list,thisindex,delims);
    newlist = listappend(newlist,thisitem,delims);
    i = i +1;
	}
 return newlist;
}
</cfscript>