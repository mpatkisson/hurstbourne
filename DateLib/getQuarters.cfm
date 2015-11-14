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
 * Returns first and last day of quarter from first year to current quarter from array of years.
 * 
 * @param aYears 	 Array of years. (Required)
 * @return Returns an array of structs. 
 * @author Steve DeWitt (steve.dewitt@milliman.com) 
 * @version 1, April 12, 2004 
 */
function getQuarters(aYears){
	var aQuarters = ArrayNew(1);
	var yLen	  = ArrayLen(aYears);
	var q1Start = '01-01-';
	var q1End	= '03-31-';
	var q2Start	= '04-01-';
	var q2End	= '06-30-';
	var q3Start	= '07-01-';
	var q3End	= '09-30-';
	var q4Start	= '10-01-';
	var q4End	= '12-31-';
	var y = 1;
	var q = 1;
	
	for(;y lte yLen;y=y+1) {
		aQuarters[y] = StructNew();
		for(q=1;q lte 4;q=q+1) {
			if(q is 1) {
				if(q1Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q1 = q1Start & aYears[y] & "~" & q1End & aYears[y];
				}
			} else if(q is 2) {
				if(q2Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q2 = q2Start & aYears[y] & "~" & q2End & aYears[y];
				}
			} else if(q is 3) {
				if(q3Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q3 = q3Start & aYears[y] & "~" & q3End & aYears[y];
				}
			} else if(q is 4) {
				if(q4Start & aYears[y] lte DateFormat(Now(),'mm-dd-yyyy')){
					aQuarters[y].q4 = q4Start & aYears[y] & "~" & q4End & aYears[y];
				}
			}
		}
	}
	return aQuarters;
}
</cfscript>