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
 * Calculate the future value of investment with regular deposits.
 * 
 * @param IT 	 Interest rate per year (8% = 0.08) 
 * @param PMT 	 Number of payments. 
 * @param PV 	 Present value. 
 * @param NP 	 Number of periods. 
 * @return Returns a numeric value. 
 * @author Raymond Thompson (rayt@qsystems.net) 
 * @version 1, April 23, 2002 
 */
function FutureValue(IR,PMT,PV,NP) {
  var tpv = abs(pv);
  var tnp = abs(np);
  var fv = pv;
  var tpmt = -abs(pmt);
  var tir = abs(ir) / 12;
  var scale=0;

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[4]);
  }
  if (ir eq 0) {
    fv = tpv + abs(tpmt * tnp);
  } else {
    q = (1 + tir)^tnp;
    fv = (-pmt + q * pmt + tir * q * tpv) / tir;
  }
  if (scale NEQ 0) {
    fv = int(fv * scale + 0.5) / scale;
  }
  return(-fv);
}
</cfscript>