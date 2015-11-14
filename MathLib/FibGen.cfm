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
 * Returns the Fibonacci sequence to n places given a starting point of x and y.
 * 
 * @param x 	 First number in the sequence. (Required)
 * @param y 	 Second number in the sequence. (Required)
 * @param numSeq 	 Number of elements to generate for the sequence. (Required)
 * @return Returns a comma-delimited list of numbers. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, June 26, 2002 
 */
function FibGen(x,y,numSeq){
  var sequence = arrayNew(1);
  var total = x+y;
  var i=1;
  sequence[1] = x;
  sequence[2] = y;
  while (i LTE numSeq-2) {
    total=(x+y); 
    ArrayAppend(sequence, total);
    x=y; 
    y=total;
    i=i+1;
  }
  return ArrayToList(sequence, ',');
}
</cfscript>