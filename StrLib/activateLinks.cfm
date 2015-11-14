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
 * Converts text links into HTML links within a string
 * 
 * @param string 	 Input string. (Required)
 * @return Returns a string. 
 * @author Robin Scherberich (scherberich.r@gmail.com) 
 * @version 1, February 22, 2011 
 */
function activateLinks( string )
{
	var stringLen = len( string );
	var currentPosition = 1;
	var urlArray = [];

	while( currentPosition < stringLen )
	{
		rezArray = REFindNoCase( "(?i)\b((?:https?://|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'"".,<>?«»‘’]))", arguments.string, currentPosition, true );
		
		if( rezArray.len[1] != 0 ){
			arrayAppend( urlArray, mid( string, rezArray.pos[1]-2, rezArray.len[1]+2 ) );
			currentPosition = rezArray.pos[1] + rezArray.len[1];
		} else {
			currentPosition = stringLen;
		}
	}

	for( i = 1; i <= arrayLen( urlArray ); i++ )
	{
		if( left( urlArray[i], 2 ) != '="' )
		{
			link = right( urlArray[i], len( urlArray[i] )-2 );
			string = replace( string, link, '<a href="'& link &'">'& link &'</a>', "all" );
		} else {
			i++;
		}
	}

	return string;
}
</cfscript>