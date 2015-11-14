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
 * Works like the built-in function lsCurrencyFormat, but do it right for Brazilian Currency (R$ - Real).
 * 
 * @param valor 	 Number to be formatted. (Required)
 * @return Returns a string. 
 * @author Fernando Segalla (segalla@intralab.com.br) 
 * @version 1, November 1, 2002 
 */
function BRCurrencyFormat(valor) {
	valor = DecimalFormat(valor);
	valor = Replace(valor,',','.','ALL');
	valor = Reverse(Replace(Reverse(valor),'.',',','ONE'));
	if(valor LT 0) return "(R$" & Right(valor,Len(valor)-1) & ")";
	else return "R$" & valor;
}
</cfscript>