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
 * Properly performs substring functionality on XML-Formatted strings.
 * 
 * @param inString 	 String to parse. (Required)
 * @param start 	 Starting position for substring. (Required)
 * @param count 	 Length of returned string. (Required)
 * @return Returns a string. 
 * @author Adam Mihlfried (adam@emscharts.com) 
 * @version 1, May 29, 2007 
 */
function xmlFormatMid(inString, start, count) {
   
   var lowStr = "";
   var retStr = "";
   var tmpStr = "";
   var reversed = "";
   var revpos = 0;
   var realpos = 0;
   var realendpos = 0;
   //Convert high ascii characters to their low ascii equivalents
   lowStr = Replace(inString, Chr(8211), Chr(45), "ALL");
   lowStr = Replace(lowStr, Chr(8212), Chr(45), "ALL");
   lowStr = Replace(lowStr, Chr(8216), Chr(39), "ALL");
   lowStr = Replace(lowStr, Chr(8217), Chr(39), "ALL");
   lowStr = Replace(lowStr, Chr(8220), Chr(34), "ALL");
   lowStr = Replace(lowStr, Chr(8221), Chr(34), "ALL");
   retStr = XmlFormat(mid(trim(lowStr), start, count));
   //if string is longer than mid intended then XmlFormat converted/added extra chars.
   if (len(retStr) gt count) {
   //find position of last ampersand if too long
  
   reversed = reverse(retStr);
   revpos = find("&", reversed);
  
   //length of string - reversed position (characters from right) 
   realpos = len(retStr) - revpos + 1;
   
   //new tmpStr is the substring of previous mid from 1 to position BEFORE ampersand
   tmpStr = mid(retStr,1,realpos-1); 
  
    realendpos = find(";",retStr,realpos);
    
   //if length of new string is zero, then string began with & and we should include symbol
    //as long as count under length of special symbol
   if (len(tmpStr) eq 0 and count gt realendpos-realpos) 
    retStr =  mid(retStr,1,count);
    //if tmpStr + symbol length less than count, then we can use
   else if ( len(tmpStr) + (realendpos - realpos + 1) lte count)
      retStr = mid(retStr, 1, count);
   else
    retStr = tmpStr;
   }
   
   return trim(retStr);
}
</cfscript>