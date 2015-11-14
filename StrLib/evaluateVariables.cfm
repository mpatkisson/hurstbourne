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
 * Replaces variable placeholders with values of said variables using any list of possible identifiers.
 * 
 * @param thisstring 	 The string to parse. (Required)
 * @param identifiers 	 Characters to use as identifiers. (Optional)
 * @return Returns a string. 
 * @author Steven Van Gemert (svg2@placs.net) 
 * @version 1, July 13, 2005 
 */
function evaluateVariables(thisstring) {
	var poundsign = "##";
	var poundsignplaceholder = "";
	var identifiers = poundsign; //Default identifier.
	var thisdelimiter = "!"; //Default delimiter.
	var i = 1;
	
	if (ArrayLen(arguments) EQ 2){ //If we were passed a list of identifiers...
		identifiers = arguments[2]; //...then use them.
	}
	while(findnocase(thisdelimiter,identifiers & poundsign)){ //If we were passed the same identifier as we chose for our delimiter, or it's a pound sign or single quote...
		thisdelimiter = chr(asc(thisdelimiter) + 1); //...then use a different delimiter.
	}
	poundsignplaceholder = repeatstring(thisdelimiter,3) & "PoundSign" & repeatstring(thisdelimiter,3); //Create the pound sign placeholder to preserve existing pound signs in the string.
	
	if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
		thisstring = replace(thisstring,poundsign,poundsignplaceholder,"ALL"); //...then replace any existing pound signs with a place holder to preserve them.
	}

	for(i=1; i LTE len(identifiers); i = i + 1){ //For each identifier...
		if(listlen(thisdelimiter & thisstring & thisdelimiter,mid(identifiers,i,1)) mod 2){ //If there is an odd number of items in the list (cursory check - not definitive - to verify that the evaluate statement will function properly).
			thisstring = replace(thisstring,mid(identifiers,i,1),poundsign,"ALL"); //...replace it with pound signs.
		}
	}

	thisstring = evaluate(de(thisstring)); //Evaluate the variables.
	
	if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
		thisstring = replace(thisstring,poundsignplaceholder,poundsign,"ALL"); //...then re-instate the preserved pound signs.
	}

	return thisstring; //Return the evaluated string.
}
</cfscript>