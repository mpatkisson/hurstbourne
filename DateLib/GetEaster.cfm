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
 * Returns the date for Easter in a given year.
 * Minor edits by Rob Brooks-Bilson (rbils@amkor.com).
 * 
 * @param TheYear 	 The year to get Easter for. 
 * @return Returns a date object. 
 * @author Ken McCafferty (mccjdk@yahoo.com) 
 * @version 1, September 4, 2001 
 */
function GetEaster() {
  Var TheYear=iif(arraylen(arguments) gt 0,"arguments[1]", "Year(Now())");       
  Var century = Int(TheYear/100);
  Var G = TheYear MOD 19;
  Var K = Int((century - 17)/25);
  Var I = (century - Int(century/4) - Int((century - K)/3) + 19*G + 15) MOD 30;
  Var H = I - Int((I/28))*(1 - Int((I/28))*Int((29/(I + 1)))*Int(((21 - G)/11)));
  Var J = (TheYear + Int(TheYear/4) + H + 2 - century + Int(century/4)) MOD 7;
  Var L = H - J;
  Var EasterMonth = 3 + Int((L + 40)/44);
  Var EasterDay = L + 28 - 31*Int((EasterMonth/4));
  return CreateDate(TheYear,EasterMonth,EasterDay);
}
</cfscript>