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
 * Converts a structure to a URL query string.
 * 
 * @param struct 	 Structure of key/value pairs you want converted to URL parameters 
 * @param keyValueDelim 	 Delimiter for the keys/values.  Default is the equal sign (=). 
 * @param queryStrDelim 	 Delimiter separating url parameters.  Default is the ampersand (&). 
 * @return Returns a string. 
 * @author Erki Esken (erki@dreamdrummer.com) 
 * @version 1, December 17, 2001 
 */
function StructToQueryString(struct) {
  var qstr = "";
  var delim1 = "=";
  var delim2 = "&";

  switch (ArrayLen(Arguments)) {
    case "3":
      delim2 = Arguments[3];
    case "2":
      delim1 = Arguments[2];
  }
	
  for (key in struct) {
    qstr = ListAppend(qstr, URLEncodedFormat(LCase(key)) & delim1 & URLEncodedFormat(struct[key]), delim2);
  }
  return qstr;
}
</cfscript>