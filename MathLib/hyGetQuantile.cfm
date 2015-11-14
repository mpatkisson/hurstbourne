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
 * Function which returns the value of a certain quantile from a list of numeric values.
 * Rewritten by Raymond Camden to include VAR statements.
 * 
 * @param qtil 	 Threshold value for the quantile, numeric between 1 and 100 (Required)
 * @param range 	 Comma delimited list of numeric values (Required)
 * @return Returns a number. 
 * @author Ralf Guttmann (ralf.guttmann@hyperspace.de) 
 * @version 1, July 13, 2006 
 */
function hyQuantile(qtil, range) {
	var rangeArr = ListToArray(range);
	var hyqtil = "";
 	var nrofelms = "";
 	var nrofsteps = "";
	var percpos = "";
	var percpos1 = "";
 	var percpos2 = "";
	var rP1 = "";
	var rP2 = "";
	var deltarp = "";
	var wfactor = "";
	var deltarp_v = "";

	qtil = qtil * 0.01;
	arraySort(rangeArr, "numeric");
  
	nrofelms = arrayLen(rangeArr);
	nrofsteps = qtil * (nrofelms - 1);
	
	if(int(nrofsteps) eq nrofsteps) {
		percpos = nrofsteps + 1;
		hyqtil = rangeArr[percpos];
    } else {
		percpos1 = Int(nrofsteps) + 1;
		percpos2 = percpos1 + 1;
		rP1 = rangeArr[percpos1];
		rP2 = rangeArr[percpos2];
		deltarp = rP2 - rP1;
		wfactor = nrofsteps - (Int(nrofsteps));
		deltarp_v = deltarp * wfactor;
		hyqtil = rP1 + deltarp_v;
	}
	return hyqtil;
}
</cfscript>