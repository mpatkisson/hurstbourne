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
 * This function formats a big decimal to scientific notation.
 * 
 * @param n 	 The number to format. (Required)
 * @param sigdigits 	 Number of significant digits. Defaults to 2. (Optional)
 * @return Returns a number. 
 * @author Tedd Van Diest (tedd@tedd.us) 
 * @version 1, July 12, 2006 
 */
function scientificFormat(n,m) {
	// init result var
	var result = "";
	// Create DecimalFormat object and initialize it with our mask.
	var df = createObject("java","java.text.DecimalFormat").init(m);
	// Create BigDecimal object and initialize it with our number.
	var bd = createObject("java","java.math.BigDecimal").init(n);
	// Format our number using our mask.
	result = df.format(bd);
	// Return results.
	return result;
}
</cfscript>