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
 * Returns True if the specified number is a perfect number.
 * 
 * @param number 	 Integer greater than zero to test. 
 * @return Returns a Boolean value. 
 * @author Rob Brooks-Bilson (rbils@amkor.com) 
 * @version 1, September 6, 2001 
 */
function IsPerfectNumber(number)
{
  Var i=0;
  Var factors = "";
  Var factorArray=0;
  Var sum=0;
  if (number lt 1){
    return False;
    break;
  }  
  for (i=1; i LTE number/2; i=i+1) {
    if (Int(number/i) EQ number/i) {
      factors = ListAppend(Factors, i);
    }
  }  
  factorArray=ListToArray(factors);
  sum=ArraySum(factorArray);
  if (sum eq number){
    return True;
  }
  else{
    return False;
  }
}
</cfscript>