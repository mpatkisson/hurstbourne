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
 * Returns a number of random selections from a list based on their given weights.
 * 
 * @param weights 	 Structure with keys and numeric values for weights. (Required)
 * @param n 	 Number of selections to make. (Required)
 * @return Returns an array. 
 * @author Chris Spencer (chrisspen@gmail.com) 
 * @version 1, May 25, 2006 
 */
function randomWeightedSelection(weights, n){
	var seq = structKeyArray(weights);
	var totals = arrayNew(1);
	var runningtotal = 0;
	var selections = arrayNew(1);
	var s = 0;
	var i = 0;
	
	for(i=1; i lte arrayLen(seq); i=i+1){
		runningtotal = runningtotal + weights[seq[i]];
		arrayAppend(totals, runningtotal);
	}
	for(s=1; s lte n; s=s+1){
		r = rand()*runningtotal;
		for(i=1; i lte arrayLen(seq); i=i+1){
			if(totals[i] gt r){
				arrayAppend(selections,seq[i]);
				break;
			}
		}
	}
	
	return selections;
}
</cfscript>