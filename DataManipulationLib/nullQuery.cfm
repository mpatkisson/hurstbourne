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
 * Initialize an empty query with default values.
 * 
 * @param q 	 Query. (Required)
 * @param Fields 	 Fields to use. (Required)
 * @param Values 	 Values to use. (Required)
 * @return Returns a query. 
 * @author John Bartlett (jbartlett@strangejourney.net) 
 * @version 1, August 10, 2007 
 */
function nullQuery(q,Fields,Values) {
	var i=0;
	var NewQ=QueryNew(Replace(Fields,"|",",","ALL"));
	if (q.RecordCount GT 0) return q;
	QueryAddRow(NewQ);
	for(i=1; i LTE ListLen(Fields,'|'); i=i+1) {
		querySetCell(NewQ,ListGetAt(Fields,i,'|'),ListGetAt(Values,i,'|'));
	}
	return NewQ;
}
</cfscript>