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
 * Returns the card type of a card number.
 * 
 * @param cardNumber 	 The credit card number. (Required)
 * @return Returns a string. 
 * @author Dave Cordes (dcordes@apoktechnology.com) 
 * @version 1, November 3, 2005 
 */
function getCardType(cardNumber) {
	var CardType = "Unknown";
	var CardLength = Len(cardNumber);
	
	if ((CardLength eq 15) and (((Left(cardNumber, 2) is "34")) or ((Left(cardNumber, 2) is "37")))) CardType = "American Express";
	if ((CardLength eq 14) and (((Left(cardNumber, 3) gte 300) and (Left(cardNumber, 3) lte 305)) or (Left(cardNumber, 2) is "36") or (Left(cardNumber, 2) is "38"))) CardType =  "Diner's Club";
	if ((CardLength eq 16) and (Left(cardNumber, 4) is "6011")) CardType =  "Discover Card";
	if ((CardLength eq 16) and (Left(cardNumber, 2) gte 51) and (Left(cardNumber, 2) lte 55)) CardType =  "MasterCard";
	if (((CardLength eq 13) or (CardLength eq 16)) and (Left(cardNumber, 1) is "4")) CardType =  "Visa";
	
	return CardType;
}
</cfscript>