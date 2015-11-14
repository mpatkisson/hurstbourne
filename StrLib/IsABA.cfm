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
 * Checks that a number is a valid ABA routing number.
 * 
 * @param number 	 Number you want to validate as an ABA routing number. 
 * @return Returns a Boolean. 
 * @author Michael Osterman (mosterman@highspeed.com) 
 * @version 1, March 21, 2002 
 */
function isABA(number) {
	var j = 0;
	var cd = 0; //check-digit value
	var result = false;
	var modVal = 0; //compared to check-digit
	var weights = ArrayNew(1);
	
	ArraySet(weights, 1, 8, 0);
	
	//set the weights for the following loop
	weights[1] = 3;
	weights[2] = 7;
	weights[3] = 1;
	weights[4] = 3;
	weights[5] = 7;
	weights[6] = 1;
	weights[7] = 3;
	weights[8] = 7;
	
	cd = Right(number,1);
	
	for (i = 1; i lte 8; i=i+1) 
	{
		j = j + ((Mid(number,i,1))*weights[i]);
	}
	
	modVal = ((10 - (j mod 10)) mod 10);
	
	if (modVal eq cd)
	{
		result = true;
	}
	
	return result;
}
</cfscript>