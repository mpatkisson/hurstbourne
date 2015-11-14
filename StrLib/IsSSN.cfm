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
 * Checks passed value to see if it is a properly formatted U.S. social security number.
 * Cameron Childress found a bug in the right(str,4) line.
 * 
 * @param str 	 String you want to validate. (Required)
 * @return Returns a Boolean. 
 * @author Jeff Guillaume (jeff@kazoomis.com) 
 * @version 2, April 27, 2005 
 */
function IsSSN(str) {
  // these may actually be valid, but for business purposes they are not allowed
  var InvalidList = "111111111,222222222,333333333,444444444,555555555,666666666,777777777,888888888,999999999,123456789";
	
  // validation based on info from: http://www.ssa.gov/employer/ssnweb.htm
  if (REFind('^([0-9]{3}(-?)[0-9]{2}(-?)[0-9]{4})$', str)) {
    if (Val(Left(str, 3)) EQ 0) return FALSE;
    if (Val(Right(str, 4)) EQ 0) return FALSE;
    if (ListFind(InvalidList, REReplace(str, "[ -]", "", "ALL"))) return FALSE;
    // still here, so SSN is valid
    return True;
  }
  // return default
  return False;
	
}
</cfscript>