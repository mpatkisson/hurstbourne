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
 * Computes the theoretical price of an equity option.
 * 
 * @param call_put_flag 	 The Call Put Flag. (Required)
 * @param S 	 The current asset price. (Required)
 * @param X 	 Exercise price. (Required)
 * @param T 	 Time to maturity. (Required)
 * @param r 	 Risk-free Interest rate. (Required)
 * @param v 	 Annualized volatility. (Required)
 * @return Returns a number. 
 * @author Alex (axs@arbornet.org) 
 * @version 1, May 9, 2003 
 */
function BlackScholes (call_put_flag,S,X,T,r,v) {
    var d1 = ( log(S / X) + (r + (v^2) / 2) * T ) / ( v * (T^0.5) );
    var d2 = d1 - v * (T^0.5);

    if (call_put_flag eq 'c')
        return S * CND(d1) - X * exp( -r * T ) * CND(d2);
    else
        return X * exp( -r * T ) * CND(-d2) - S * CND(-d1);
}
</cfscript>