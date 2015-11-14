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
 * Handles commodity month translation tasks.
 * Removed duplicate My case - rcamden
 * 
 * @param monthcode 	 Month, or month code, to translate. 
 * @return Returns a string. 
 * @author Mark Kruger (Mkruger@cfwebtools.com) 
 * @version 1.1, April 11, 2002 
 */
function TranslateFutureMonth(monthcode) {
	var TheMonth =	'';
	switch(Monthcode)
	{
		// Translate the letter code into the month code
		case 'F':	{	TheMonth	=	'January';		break;		}
		case 'G':	{	TheMonth	=	'February';		break;		}
		case 'H':	{	TheMonth	=	'March';		break;		}
		case 'J':	{	TheMonth	=	'April';		break;		}
		case 'K':	{	TheMonth	=	'May';			break;		}
		case 'M':	{	TheMonth	=	'June';			break;		}
		case 'N':	{	TheMonth	=	'July';			break;		}
		case 'Q':	{	TheMonth	=	'August';		break;		}
		case 'U':	{	TheMonth	=	'September';	break;		}
		case 'V':	{	TheMonth	=	'October';		break;		}
		case 'X':	{	TheMonth	=	'November';		break;		}
		case 'Z':	{	TheMonth	=	'December';		break;		}
		// Translate the month description into the letter code
		case 'January':		{	TheMonth	=	'F';	break;		}
		case 'February':	{	TheMonth	=	'G';	break;		}
		case 'March':		{	TheMonth	=	'H';	break;		}
		case 'April':		{	TheMonth	=	'J';	break;		}
		case 'June':		{	TheMonth	=	'M';	break;		}
		case 'July':		{	TheMonth	=	'N';	break;		}
		case 'August':		{	TheMonth	=	'Q';	break;		}
		case 'September':	{	TheMonth	=	'U';	break;		}
		case 'October':		{	TheMonth	=	'V';	break;		}
		case 'November':	{	TheMonth	=	'X';	break;		}
		case 'December':	{	TheMonth	=	'Z';	break;		}
		// Translate 3 letter month code into letter code
		case 'Jan':			{	TheMonth	=	'F';	break;		}
		case 'Feb':			{	TheMonth	=	'G';	break;		}
		case 'Mar':			{	TheMonth	=	'H';	break;		}
		case 'Apr':			{	TheMonth	=	'J';	break;		}
		case 'May':			{	TheMonth	=	'K';	break;		}
		case 'Jun':			{	TheMonth	=	'M';	break;		}
		case 'Jul':			{	TheMonth	=	'N';	break;		}
		case 'Aug':			{	TheMonth	=	'Q';	break;		}
		case 'Sep':			{	TheMonth	=	'U';	break;		}
		case 'Oct':			{	TheMonth	=	'V';	break;		}
		case 'Nov':			{	TheMonth	=	'X';	break;		}
		case 'Dec':			{	TheMonth	=	'Z';	break;		}
	}
	
	return(TheMonth);		
}
</cfscript>