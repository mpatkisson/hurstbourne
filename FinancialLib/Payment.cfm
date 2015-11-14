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
 * Calculate payment on loan.
 * 
 * @param IR 	 Interest rate per year (8.5% = 0.085) 
 * @param PV 	 Present Value 
 * @param FV 	 Future Value (Generally zero for calculating payments. Non zero for pay down to ammount.) 
 * @param NP 	 Number of periods. 
 * @return Returns a numeric value. 
 * @author Raymond Thompson (rayt@qsystems.net) 
 * @version 1, August 2, 2001 
 */
function Payment(IR,PV,FV,NP) {
  var tir = abs(ir) / 12;
  var tfv = abs(fv);
  var tpv = abs(pv);
  var scale = 0;
  var pmt=0;
  var q = (1 + tir)^ abs(np);

  if(ArrayLen(Arguments) gt 4) {
    scale = 10^abs(Arguments[5]);
  }
  pmt = (tir * (tfv + q * tpv)) / (-1 + q);
  if (scale NEQ 0)
    pmt = int(pmt * scale + 0.5) / scale;
  return(-pmt);
}
</cfscript>