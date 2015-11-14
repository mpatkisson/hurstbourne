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
 * Converts Barcode to valid ISBN number (without &quot;-&quot;).
 * 
 * @param BarCodeNum 	 Bar code number. (Required)
 * @return Returns a string. 
 * @author Amar Trivedi (atrivedi@ekomcorp.com) 
 * @version 1, January 28, 2004 
 */
function getISBN(BarCodeNum) {
  var x ='';
  var sum = 0;
  var i = 0;
  var digitsum = 0;
  var ModSum=0;

  // Barcode Must be 13 digits AND numeric 
  if(len(BarCodeNum) NEQ  13) return 0;
  if(not IsNumeric(BarCodeNum)) return 0;
  /** get rid of first 3 characters since they are  NOT used for conversion **/
  x = right(BarCodeNum,10);
  x = left(x,9);
  // loop through middle 9 digits
  for(i = 1; i LTE 9; i = i + 1) {
       digitsum = Mid( x, i, 1 ) * i;
       sum = sum + digitsum;
  }
  // check for the last letter/digit
  ModSum = sum MOD 11;
  if(ModSum EQ 10) ModSum = "x";
  return x & ModSum;
}
</cfscript>