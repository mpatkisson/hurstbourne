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
 * Turn 1 into 1st, 2 into 2nd, etc.
 * 
 * @param num 	 Number to format. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, December 23, 2002 
 */
function IntegerRankFormat(number){
	//grab the last digit
	var lastDigit = right(number,1);
	//grab the last two digits
	var lastTwoDigits = right(number,2);
	//use numberFormat() to put in commas for number larger than 999
	number = numberFormat(number);
	//11, 12, and 13 are special cases, so deal with them
	switch(lastTwoDigits){
		case 11:{
			return number & "th";
		}
		case 12:{
			return number & "th";
		}
		case 13:{
			return number & "th";
		}
	}
	//append the correct suffix based on the last number
	switch(lastDigit){
		case 1:{
			return number & "st";
		}
		case 2:{
			return number & "nd";
		}
		case 3:{
			return number & "rd";
		}
		default:{
			return number & "th";
		}
	}
}
</cfscript>