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
 * Calculates the average of a set of numbers omitting values less than 1 from that average.
 * 
 * @param data 	 The array to average. (Required)
 * @return Returns a number. 
 * @author David Simms (dsimms@dcbar.org) 
 * @version 1, January 12, 2004 
 */
function averageWithoutZeros(data) {
	var counter = arrayLen(data);
	
	//remove zeros
	for(;counter gte 1;counter=counter-1) {
		if(data[counter] lt 1) arrayDeleteAt(data,counter);
	} 

	if(arrayLen(data)) return arrayAvg(data);
	else return 0;
}
</cfscript>