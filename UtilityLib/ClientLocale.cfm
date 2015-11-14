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
 * Attempts to deduce the visitor's locale.
 * 
 * @return Returns a string. 
 * @author Matthew Walker (matthew@cabbagetree.co.nz) 
 * @version 1, April 23, 2002 
 */
function ClientLocale() {
	var FirstLocale = SpanExcluding(CGI.HTTP_ACCEPT_LANGUAGE, ",;");
	var LanguageCode = ListFirst(FirstLocale, "-");
	var CountryCode = "";
	if ( ListLen(FirstLocale, "-") EQ 2 )
		CountryCode = ListGetAt(FirstLocale, 2, "-");
	switch(LanguageCode){
  			case "nl":
			switch(CountryCode){
  					case "be":
     					return "Dutch (Belgian)";
				default:
     					return "Dutch (Standard)";
			}		
		case "en":
			switch(CountryCode){
  					case "au":
     					return "English (Australian)";
				case "ca":
     					return "English (Canadian)";
				case "nz":
     					return "English (New Zealand)";
				case "gb":
     					return "English (UK)";
				case "us":
     					return "English (US)";
				default:
					return "English (UK)";
			}		
		case "fr":
			switch(CountryCode){
				case "be":
					return "French (Belgian)";
				case "ca":
					return "French (Canadian)";
				case "ch":
					return "French (Swiss)";
				default:
					return "French (Standard)";
			}
		case "de":
			switch(CountryCode){
				case "at":
					return "German (Austrian)";
				case "ch":
					return "German (Swiss)";
				default:
					return "German (Standard)";
			}		
		case "it":
			switch(CountryCode){
				case "ch":
					return "Italian (Swiss)";
				default:
					return "Italian (Standard)";
			}	
		case "nb":
			return "Norwegian (Bokmal)";	
		case "nn":
			return "Norwegian (Nynorsk)";
		case "pt":
			switch(CountryCode){
				case "br":
					return "Portuguese (Brazilian)";
				default:
					return "Portuguese (Standard)";
			}	
		case "es":
			switch(CountryCode){
				case "mx":
					return "Spanish (Mexican)";
				default:
					return "Spanish (Modern)";
			}		
	    default:
    			return GetLocale();
	}		
}
</cfscript>