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
 * Returns true if the number passed it is even, returns false if it is not.
 * 
 * @param num 	 Number you want to test. 
 * @return Returna a Boolean. 
 * @author Mark Andrachek (hallow@webmages.com) 
 * @version 1, November 27, 2001 
 */
function IsEven(num) {
  // We only operate on numbers, otherwise we
  // we just return false.
  if (IsNumeric(num)) {
    //if it's evenly divisible by 2, it's
    //even. otherwise, it's odd. ;)
    return (not num mod 2);
  }
  else {
    return No;
  }
}
</cfscript>