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
 * You provide me with a decimal number, and a string for a column name and I will return to you a query containing of the decimal values for each resulting non-zero value when your number is converted to binary.
 * 
 * @param decVal 	 Decimal value. (Required)
 * @param colName 	 Query column name to use. (Required)
 * @return Returns a query. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, November 3, 2005 
 */
function decBitwiseToQuery(decVal,colName) {
	// create an empty counter
	var i = "";
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	
	// create a query object
	var qry = queryNew(colName);
	
	// loop through the places in the binary number, going from right to left.
	// Note, this is a brute-force method, and I'm sure some smart person out there
	// could figure out how to do this with pure bitwise functions. Me, I'm not that person.
	for(i = len(bVal); ; i = i - 1) {
			// set cur to the decimal value of the current binary place value
			cur = val(b * mid( bVal , i , 1 ));
			
			// If the result is greater than zero, add the result as a row to the query
			if (cur gt 0) {
				queryAddRow(qry);
				querySetCell(qry,colName,cur);
			};
				
			// double the value of our binary seed, for the next place if necessary
			b = 2 * b;
			
			//exit loop when the last place is processed
			if (i eq 1) break;
		}
	
	// return the query object
	return qry;
}
</cfscript>