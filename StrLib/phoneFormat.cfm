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
 * Allows you to specify the mask you want added to your phone number.
 * v2 - code optimized by Ray Camden
 * v3.01 
 * v3.02 added code for single digit phone numbers from John Whish   
 * v4 make a default format - by James Moberg
 * 
 * @param varInput 	 Phone number to be formatted. (Required)
 * @param varMask 	 Mask to use for formatting. x represents a digit. Defaults to (xxx) xxx-xxxx (Optional)
 * @return Returns a string. 
 * @author Derrick Rapley (adrapley@rapleyzone.com) 
 * @version 4, February 11, 2011 
 */
function phoneFormat(varInput) {
       var curPosition = "";
       var i = "";
       var varMask = "(xxx) xxx-xxxx";
       var newFormat = "";
       var startpattern = "";
   if (arrayLen(arguments) gte 2){ varMask = arguments[2]; }
       newFormat = trim(ReReplace(varInput, "[^[:digit:]]", "", "all"));
       startpattern = ReReplace(ListFirst(varMask, "- "), "[^x]", "", "all");
       if (Len(newFormat) gte Len(startpattern)) {
               varInput = trim(varInput);
               newFormat = " " & reReplace(varInput,"[^[:digit:]]","","all");
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
               for (i=1; i lte len(trim(varmask)); i=i+1) {
                       curPosition = mid(varMask,i,1);
                       if(curPosition neq "x") newFormat = insert(curPosition,newFormat, i-1) & " ";
               }
               newFormat = reverse(newFormat);
               varmask = reverse(varmask);
       }
       return trim(newFormat);
}
</cfscript>