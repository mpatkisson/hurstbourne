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
 * Check the percentage change between 2 numbers.
 * 
 * @param var1 	 The first number. (Required)
 * @param var2 	 The second number. (Required)
 * @return Returns a string. 
 * @author Guillermo Cruz (gcruz@elkiwa.com) 
 * @version 1, July 3, 2002 
 */
function PercentageChange(var1,var2){			
	var maxNumber = max(var1,var2);
	var minNumber = min(var1,var2);
	var change = maxNumber - minNumber;
	var symbol = "";
		
	if (var1 EQ var2)   return 0;
	change = NumberFormat(change / var1 * 100, 0.00);	
	
	if(var1 GT var2) symbol = "-";
	else symbol = "+";

	return symbol & " " & change;	
}
</cfscript>