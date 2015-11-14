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
 * Translates a Cryptic Futures symbol into a descriptive structure.
 * 
 * @param Future 	 The futures symbol. 
 * @return Returns a structure. 
 * @author Mark Kruger (Mkruger@cfwebtools.com) 
 * @version 1, January 29, 2002 
 */
function TranslateFuture(Symbol) {
	var	TheYear				=	'';
	var	TheMonth			=	'';
	var SymbolStruct		=	StructNew();
	
	if(Symbol IS NOT '') {
		Symbol				=	replace(Symbol,'0','');
		TheYear				=	'200' &  val(Reverse(Symbol));
		Symbol				=	Replace(symbol,val(reverse(symbol)),'');
		TheMonth			=	right(symbol,1);
		switch(TheMonth)
		{
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
		}
		
		
		Symbol				=	left(symbol,len(symbol)-1);
		SymbolStruct.Year	=	TheYear;
		SymbolStruct.Root	=	Symbol;
		SymbolStruct.Month	=	TheMonth;
	}
	else {
		SymbolStruct		=	structnew();	
		SymbolStruct.Year	=	'';
		SymbolStruct.Root	=	'';
		SymbolStruct.Month	=	'';
	}
	return(symbolStruct);
}
</cfscript>