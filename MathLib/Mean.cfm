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
 * Returns the mean (average) value for a set of numberic values.
 * Although you could use the ArrayAvg function on an array, this funciton handles arrays so that it can be called from other functions in this library (see CVpop and CVsamp for examples).
 * 
 * @param values 	 Comma delimited list or one dimensional array of numeric values. 
 * @return Returns a simple value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1.0, July 18, 2001 
 */
function Mean(values)
{
  if (IsArray(values)){
     Return ArrayAvg(values);
    }
  else {
     Return ArrayAvg(ListToArray(values));
    }  
}
</cfscript>