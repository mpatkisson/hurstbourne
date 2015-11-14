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
 * Remove extra characters from a form post added by Mac IE.
 * Changed attributes check to form[ check.
 * 
 * @return Returns True. 
 * @author Anthony Cooper (ant@bluevan.co.uk) 
 * @version 2, February 7, 2003 
 */
function FixMacPost() {
  var thisField	= "";
	
  if (findNoCase("mac", cgi.HTTP_USER_AGENT) AND findNoCase("msie", cgi.HTTP_USER_AGENT)) {
    for (thisField in form) {
      if ((len(form[thisField]) GTE 2) AND NOT findNoCase(getTempDirectory(), form[thisField])) {
       form[thisField] = trim(form[thisField]);
      }
    }
  }
  return true;

}
</cfscript>