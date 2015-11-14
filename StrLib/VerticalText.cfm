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
 * Take a string, make it appear vertically.
 * 
 * @param text 	 Text to modify. (Required)
 * @return Returns a string. 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, August 14, 2002 
 */
function VerticalText(text){
	//build an array of the characters in the string
	var arrText = arrayNew(1);
	//a variable for looping
	var ii = 1;
	//the len of the string
	var textLen = len(text);
	//resize the array the length of the string
	arrayResize(arrText,textLen);
	//loop through the length of the string, building the array
	for(ii = 1; ii LTE textLen; ii = ii + 1){
		arrText[ii] = mid(text,ii,1);
	}
	return arrayToList(arrText,"<br />");
}
</cfscript>