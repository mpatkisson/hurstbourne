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
 * Returns a list of ancestor custom tags.
 * 
 * @return Returns a list. 
 * @author Jordan Clark (JordanClark@Telus.net) 
 * @version 1, February 20, 2003 
 */
function getBaseCustomTagList() {
   var x = 1;
   var customTags = "";
   var baseTags = listToArray( getBaseTagList() );
   
   for( x = 1; x LTE arrayLen( baseTags ); x = x + 1 )
   {
      if( left( baseTags[ x ], 3 ) IS "CF_" )
      {
         customTags = listAppend( customTags, baseTags[ x ] );
      }
   }
   
   return customTags;
}
</cfscript>