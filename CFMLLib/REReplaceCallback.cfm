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

<!---
 REReplaceCallback behaves like REReplace, except instead of supplying a replacement string, you supply a function to invoke on each match.
 
 @param string 	 String to parse. (Required)
 @param pattern 	 Regex pattern to use. (Required)
 @param callback 	 UDF to be used as a callback. (Required)
 @param scope 	 How many replacements should be made. Defaults to one. (Optional)
 @return Returns a string. 
 @author Barney Boisvert (bboisvert@gmail.com) 
 @version 1, March 10, 2010 
--->
<cffunction name="REReplaceCallback" access="private" output="false" returntype="string">
  <cfargument name="string" type="string" required="true" />
  <cfargument name="pattern" type="string" required="true" />
  <cfargument name="callback" type="any" required="true" />
  <cfargument name="scope" type="string" default="one" />
  <cfscript>
  var start = 0;
  var match = "";
  var parts = "";
  var replace = "";
  var i = "";
  var l = "";
  while (true) {
    match = REFind(pattern, string, start, true);
    if (match.pos[1] EQ 0) {
      break;
    }
    parts = [];
    l = arrayLen(match.pos);
    for (i = 1; i LTE l; i++) {
      if (match.pos[i] EQ 0) {
        arrayAppend(parts, "");
      } else {
        arrayAppend(parts, mid(string, match.pos[i], match.len[i]));
      }
    }
    replace = callback(parts);
    start = start + len(replace);
    string = mid(string, 1, match.pos[1] - 1) & replace & removeChars(string, 1, match.pos[1] + match.len[1] - 1);
    if (scope EQ "one") {
      break;
    }
  }
  return string;
  </cfscript>
</cffunction>