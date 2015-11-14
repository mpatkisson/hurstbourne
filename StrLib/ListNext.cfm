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
 * Given the current list item, returns the next item within a list of unique values.
 * Mods by RCamden to make current_pos see if it was equal to OR greater than list lenth, plus original code didn't use custom delim for the listlen check.
 * 
 * @param currentItem 	 The current item in the list. (Required)
 * @param theList 	 The list to examine. (Required)
 * @param theDelim 	 List delimiter. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, October 10, 2002 
 */
function ListNext(currentItem, theList){
	var current_pos   = 0;
	var theDelim      = ",";

	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	current_pos = ListFind(theList, currentItem, theDelim);

	if(current_pos eq ListLen(theList, theDelim)) return ListFirst(theList, theDelim) ;
	else return ListGetAt(theList, current_pos+1, theDelim);
}
</cfscript>