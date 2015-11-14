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
 * Title cases all elements in a list.
 * 
 * @param list 	 List to modify. (Required)
 * @param delimiters 	 Delimiters to use. Defaults to a space. (Optional)
 * @return Returns a string. 
 * @author Adrian Lynch (adrian.l@thoughtbubble.net) 
 * @version 1, November 3, 2003 
 */
function TitleCaseList( list, delimiters ) {

	var returnString = "";
	var isFirstLetter = true;
	
	// Loop through each character in list
	for ( i = 1; i LTE Len( list ); i = i + 1 ) {
	
		// Check if character is a delimiter
		if ( Find( Mid(list, i, 1 ), delimiters, 1 ) ) {
			
			//	Add character to variable returnString unchanged
			returnString = returnString & Mid(list, i, 1 );
			isFirstLetter = true;
				
		} else {
		
			if ( isFirstLetter ) {
			
				// Uppercase
			 	returnString = returnString & UCase(Mid(list, i, 1 ) );
				isFirstLetter = false;
					
			} else {
				
				// Lowercase
				returnString = returnString & LCase(Mid(list, i, 1 ) );
				
			}
			
		}
		
	}
	
	return returnString;
}
</cfscript>