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
 * Function that formats a numeric list so that successive numbers are shown as a series.
 * 
 * @param theList 	 The list to parse. (Required)
 * @return Returns a string. 
 * @author Mosh Teitelbaum (mosh.teitelbaum@evoch.com) 
 * @version 2, January 14, 2010 
 */
function formatListAsSeries(theList) {
    var lastEle = "";
    var isSet = false;
    var fList = "";
    var currEle = "";
    var idx = 0;
	
	theList = listSort(theList, "numeric", "asc");
	
	for ( idx = 1; idx LTE ListLen(theList); idx = idx + 1 ) {
		currEle = ListGetAt(theList, idx);
		
		if ( Len(lastEle) EQ 0 ) {
			fList = fList & currEle;
			lastEle = currEle;
			isSet = false;
		} else if ( lastEle EQ currEle ) {
			//do nothing
		} else if ( lastEle + 1 NEQ currEle ) {
			if ( isSet ) {
				fList = fList & lastEle;
			}
			fList = fList & ", " & currEle;
			lastEle = currEle;
			isSet = false;
		} else {
		if ( NOT isSet ) {
			fList = fList & "-";
		}
		lastEle = currEle;
		isSet = true;
		}
	}

	if ( isSet ) {
		fList = fList & lastEle;
	}

	return fList;
}
</cfscript>