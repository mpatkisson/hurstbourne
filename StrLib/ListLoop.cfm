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
 * Applies simple evaluations to every element in a list.
 * 
 * @param theList 	 The list to work with. (Required)
 * @param theEval 	 The evaluation to execute. (Required)
 * @param theDelim 	 Delimiter to use. Defaults to a comma. (Optional)
 * @return Returns a string. 
 * @author Shawn Seley (shawnse@aol.com) 
 * @version 1, June 26, 2002 
 */
function ListLoop(theList, theEval) {
	var i             = 0;
	var theList_len   = 0;
	var x             = "";

	var theDelim      = ",";
	if(ArrayLen(Arguments) GTE 3) theDelim = Arguments[3];

	theList_len   = ListLen(theList, theDelim);

	for (i=1; i LTE theList_len; i=i+1) {
		x = ListGetAt(theList, i, theDelim);
		theList = ListSetAt(theList, i, Evaluate(theEval), theDelim);
	}

	return theList;
}
</cfscript>