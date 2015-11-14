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
 * This function is to be used, to sort a list that has numeric and text values.
 * 
 * @param list 	 List to sort. (Required)
 * @return Returns a string. 
 * @author Matt (Coldfusion@spiraldev.com) 
 * @version 1, January 12, 2004 
 */
function numTextListSort(list) {
	var numArray=arrayNew(1);
	var textArray=arrayNew(1);
	var mg = 1;
	var data = "";
	
	//convert to array for speed
	data = listToArray(list);
	
	//loop through the list passed to the function
	for(;mg lte arrayLen(data);mg=mg+1){
		//if the value at this position of the list is numeric put it in the numList List
		if(isNumeric(data[mg])) numArray[arrayLen(numArray)+1] = data[mg];
		//else put it in the textList List
		else textArray[arrayLen(textArray)+1] = data[mg];
	}
	
	//sort the numList
	arraySort(numArray,"numeric");
	//sort the textList
	arraySort(textArray,"text");
	//put together
	for(mg=1;mg lte arrayLen(textArray);mg=mg+1) {
		numArray[arrayLen(numArray)+1] = textArray[mg];
	}
	
	//return the mainList
	return arrayToList(numArray);
	
}
</cfscript>