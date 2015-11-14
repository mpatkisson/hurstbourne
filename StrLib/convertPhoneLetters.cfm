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
 * Converts the letters in a phone number to the corresponding digits on an American phone.
 * version 1.0 by Brian Swartzfager
 * 
 * @param oldNumber 	 A string representing the phone number to convert (Optional)
 * @return A string with letters converted back to digits 
 * @author Brian Swartzfager (bcswartz@gmail.com) 
 * @version 1.0, August 26, 2012 
 */
public string function convertPhoneLetters(required string oldNumber) {
  var newNumber= arguments.oldNumber;
  var regArray= [
    "[A-Ca-c]",
    "[D-Fd-f]",
    "[G-Ig-i]",
    "[J-Lj-l]",
    "[M-Om-o]",
    "[P-Sp-s]",
    "[T-Vt-v]",
    "[W-Zw-z]"
  ];
		
  var resultArray= [
    2,3,4,5,6,7,8,9
  ];
		
  for (var x=1; x <= arrayLen(regArray); x++) {
    newNumber= REReplace(newNumber,regArray[x],resultArray[x],"all");
  }
		
  return newNumber;
}
</cfscript>