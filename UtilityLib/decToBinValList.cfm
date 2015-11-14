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
 * Converts decimal number to list of binary place values.
 * 
 * @param decVal 	 Decimal value. (Required)
 * @return Returns a string. 
 * @author Alan McCollough (amccollough@anmc.org) 
 * @version 1, November 3, 2005 
 */
function decToBinValList(decVal) {
	// create an empty counter
	var i = "";		
	// create an empty 'current value'
	var cur = "";
	// convert decimal val to binary
	var bVal = FormatBaseN(val(decVal), 2);
	// set our binary seed to 1, the first place in the binary system
	var b = 1;
	// create an empty list to hold the results
	var resultList = "";
	
	// loop through the places in the binary number, going from right to left.
	for(i = len(bVal); ; i = i - 1) {			
			cur = val(b * mid( bVal , i , 1 ));
			if (cur gt 0) resultList = listAppend(resultList,cur);

			// double the value of our binary seed
			b = 2 * b;
			//exit loop when the last bit is processed	
			if (i eq 1) break;
		}
	
	// return the list	
	return resultList;
}
</cfscript>