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
 * Computes the mathematical function Mod(y,x).
 * 
 * @param y 	 Number to be modded. 
 * @param x 	 Devisor. 
 * @return Returns a numeric value. 
 * @author Tom Nunamaker (tom@toshop.com) 
 * @version 1, February 24, 2002 
 */
function ProperMod(y,x) {
  var modvalue = y - x * int(y/x);
  
  if (modvalue LT 0) modvalue = modvalue + x;
  
  Return ( modvalue );
}
</cfscript>