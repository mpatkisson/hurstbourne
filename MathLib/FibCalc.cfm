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
 * This script Calculates the Fibonacci sequence  (each integer is the sum of the two previous integers).
 * 
 * @param x 	 First number in the Fibonacci sequence. (Required)
 * @param y 	 Second number in the Fibonacci sequence. (Required)
 * @param top 	 Ceiling for the Fibonacci number.  The sequence will terminate when this value is reached. (Required)
 * @return Returns a comma-delimited list of numeric values. 
 * @author Phillip B. Holmes (pholmes@mediares.com) 
 * @version 1, June 26, 2002 
 */
function FibCalc(x,y,top){
  var sequence = arrayNew(1);
  var total = x+y;
  sequence[1] = x;
  sequence[2] = y;
  while (total LTE top) {
    ArrayAppend(sequence, total);
    x=y; 
    y=total;
    total=(x+y); 
  }
  return ArrayToList(sequence, ',');
}
</cfscript>