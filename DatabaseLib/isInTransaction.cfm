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
 * Returns true if the call to it is within a CFTRANSACTION block
 * v0.1 by Bilal Soylu
 * v1.0 by Adam Cameron: simplifying logic &amp; converting to script
 * v1.1 by Adam Cameron: fixed bug causing potential false positives (as advised by Bilal)
 * 
 * @return Returns true if the call was within a CFTRANSACTION, otherwise false. 
 * @author Bilal Soylu (bilalsoylu@gmail.com) 
 * @version 1.1, September 24, 2012 
 */
function isInTransaction(){
	var result = createObject("java", "coldfusion.tagext.sql.TransactionTag").getCurrent();
	return structKeyExists(local, "result");
}
</cfscript>