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
 * Mimics the functionality of JavaScript Splice() method
(https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/splice)
 * version 0.1 by Joshua Miller
 * version 1.0 by Adam Cameron - reworking so it more closely emulates its Javascript namesake
 * 
 * @param array 	 The array to splice. (Required)
 * @param index 	 Index at which to start changing the array. If negative, will begin that many elements from the end. (Required)
 * @param howMany 	 An integer indicating the number of old array elements to remove. If howMany is 0, no elements are removed. In this case, you should specify at least one new element. If no howMany parameter is specified (second syntax above, which is a SpiderMonkey extension), all elements after index are removed. (Required)
 * @return The updated array. 
 * @author Joshua Miller (joshuamil@gmail.com) 
 * @version 1, July 24, 2012 
 */
function arraySplice(array, index, howMany) {
	var i = 0;
	
	// If negative, will begin that many elements from the end	
	if (index <= 0){
		index = arrayLen(array) + (index + 1);
	}

	// get rid of however many they specify
	for (i=1; i LE howMany; i++){
		if (index LE arrayLen(array)){
			arrayDeleteAt(array, index);
		}
	}

	for (i=4; i LE arrayLen(arguments); i++){
		if (index GE arrayLen(array)){
			arrayAppend(array, arguments[i]);
			index++;
		}else{
			arrayInsertAt(array, index+(i-4), arguments[i]);
		}
	}

	return array;
}
</cfscript>