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
 * Replaces a huge amount of unnecessary whitespace from your HTML code.
 * 
 * @param sInput 	 HTML you wish to compress. (Required)
 * @return Returns a string. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, November 19, 2002 
 */
function HtmlCompressFormat(sInput)
{
   var level = 2;
   if( arrayLen( arguments ) GTE 2 AND isNumeric(arguments[2]))
   {
      level = arguments[2];
   }
   // just take off the useless stuff
   sInput = trim(sInput);
   switch(level)
   {
      case "3":
      {
         //   extra compression can screw up a few little pieces of HTML, doh         
         sInput = reReplace( sInput, "[[:space:]]{2,}", " ", "all" );
         sInput = replace( sInput, "> <", "><", "all" );
         sInput = reReplace( sInput, "<!--[^>]+>", "", "all" );
         break;
      }
      case "2":
      {
         sInput = reReplace( sInput, "[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
      case "1":
      {
         // only compresses after a line break
         sInput = reReplace( sInput, "(" & chr( 10 ) & "|" & chr( 13 ) & ")+[[:space:]]{2,}", chr( 13 ), "all" );
         break;
      }
   }
   return sInput;
}
</cfscript>