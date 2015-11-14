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
 * Checks a phone number for Australian format.
 * 
 * @param phoneNumber 	 The phone number to check. (Required)
 * @return Return a boolean. 
 * @author Gary Crouch (gc@anatex.net) 
 * @version 1, July 27, 2005 
 */
function ozPhoneFormatPlus(phoneNumber){
	//REGX to find chrs thats are not numbers or <spaces>
	var re = "[^0-9\.[:space:]]";
	//Allowed 2nd numbers in an Ausie Phone number starting in zero
	var allowedNumbers = "2,3,4,5,7,8";
	//2nd digit in the string
	var current2ndNumber = mid( replace( trim(phoneNumber), " ", "" ), 2, 1 );

	//Numbers and spaces are ok
	if(reFindNoCase(re, trim(phoneNumber))) return false;
	
	//Remove spaces and count len must be less than or equal 10
	if(len( replace( trim(phoneNumber), " ", "" ) ) gt 10) return false;
	
	//If the number starts with a zero then it must have a 2,3,4,7,8 as the next digit
	if (left ( replace( trim(phoneNumber), " ", "" ), 1 ) eq 0 and not listFind( allowedNumbers, current2ndNumber ) ) return false;
	
	//If we got here then we must be ok
	return true;
}
</cfscript>