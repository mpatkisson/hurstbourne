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
 * Returns True if the specified number is a prime number.
 * Minor edits by Rob Brooks-Bilson (rbils@amkor.com).  Edit by Steve Ford (steve.ford@enline.com) to fix misidentification of 4 as a prime number.  Algorithm improved by Shakti Shrivastava (divine_shammer@yahoo.com) -check up to sqr root of integer.  Further refined by Sierra Bufe (sierra@brighterfusion.com).
 * 
 * @param inNum 	 Any integer greater than one that  you wish to test for prime. 
 * @return Returns a Boolean value 
 * @author Douglas Williams (klenzade@i-55.com) 
 * @version 1.2, November 21, 2001 
 */
function IsPrimeNumber(inNum)
{
  var i=0;
  if (inNum lt 2){
    return False;
    break;
  }
  for (i=2; i LTE (sqr(inNum)); i=i+1) {
    if (NOT inNum MOD i) {
      return False;
      break;
    }
  }
  return True;
}
</cfscript>