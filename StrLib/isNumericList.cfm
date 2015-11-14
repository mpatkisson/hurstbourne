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
 * Checks if a list consists of numeric values only.
 * 
 * @param nList 	 List to check. 
 * @param delimiter 	 Delimiter for the list. Defaults to a comma. 
 * @return Returns a boolean. 
 * @author John J. Rice (john@johnjrice.com) 
 * @version 1, March 20, 2002 
 */
function isNumericList(nList) {
	var intIndex	= 0;
	var aryN		= arrayNew(1);
	var strDelim	= ",";

	/*	default list delimiter to a comma unless otherwise specified			*/
	if (arrayLen(arguments) gte 2){
		strDelim	= arguments[2];
	}
  
	/*	faster to work with arrays vs lists										*/
	aryN		= listToArray(nlist,strDelim);
	
	for (intIndex=1;intIndex LTE arrayLen(aryN);intIndex=incrementValue(intIndex)) {
		if (compare(val(aryN[intIndex]),aryN[intIndex])) {
			/*	hit a non-numeric list element, send the no-go back				*/
			return false;
		}
	}
	/*	made it through the list at this point, send the ok back				*/	
	return true;
}
</cfscript>