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
 * This will generate the specified number of unique random numbers.
 * 
 * @param count 	 Number of unique random numbers. (Required)
 * @param start 	 Lower range of random numbers. (Required)
 * @param end 	 Upper range of random numbers. (Required)
 * @return Returns an array. 
 * @author Srinivas.V.K (vksrinu@gmail.com) 
 * @version 1, December 1, 2006 
 */
function randomGenerator(count,start,end) {
	var myArray = arrayNew(1);
	var i = 0;
	var ran = 0;
			
	if((arguments.end-arguments.start+1) lt arguments.count) arguments.count = arguments.end-arguments.start+1;
	for(;arrayLen(myArray) lt arguments.count; i=i+1) {
		ran=randRange(arguments.start,arguments.end);
		//before appending random number to array,check the number in array
		if(not listFind(arrayToList(myArray),ran)) 
			arrayAppend(myArray,ran);
	}
	return myArray;
}
</cfscript>