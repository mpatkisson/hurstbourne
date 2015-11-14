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
 * Converts elements in a quoted list to an array.
 * 
 * @param theList 	 The list to parse. (Required)
 * @return Returns an array. 
 * @author Anthony Cooper (ant@outsrc.co.uk) 
 * @version 1, January 3, 2007 
 */
function quotedListToArray(theList) {
	var items = arrayNew( 1 );
	var i = 1;
	var start = 1;
	var search = structNew();
	var quoteChar = """";

	while(start LT len(theList)) {
		search = reFind('(\#quoteChar#.*?\#quoteChar#)|([0-9\.]*)', theList, start, true );
			
		if (arrayLen(search.LEN) gt 1) {
			items[i] = mid(theList, search.POS[1], (search.LEN[1])); //Extract string
			items[i] = reReplace(items[i], '^\#quoteChar#|\#quoteChar#$', "", "All" );	 //Remove double quote character
			start = search.POS[1] + search.LEN[1] + 1;
			i = i + 1;
		}
		else {
			start = Len( theList );
		}
	}
		
	return items;	
}
</cfscript>