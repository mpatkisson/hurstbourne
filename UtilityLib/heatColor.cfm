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
 * Assign a &quot;heat&quot; color based on value's position within the range.
 * 
 * @param num 	 Value to check. (Required)
 * @param minVal 	 Minimum value. Defaults to 1. (Optional)
 * @param maxVal 	 Maximum value. Defaults to 100. (Optional)
 * @param colorStyle 	 Either roygiv or greentored. Defaults to greentored. (Optional)
 * @param lightness 	 Lightness of color. 0 is darkest, 0.9 is lightest. Defaults to 0. (Optional)
 * @param reverseOrder 	 Colors will go highest to lowest unless this argument is true. Defaults to false. (Optional)
 * @return Returns a string. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, August 5, 2011 
 */
function heatColor(num) {
	var minval = 1;
	var maxval = 100;
	var colorStyle = 'greentored'; //roygbiv OR greentored
	var lightness = 0;  //sets lightness of color - 0 is darkest, 0.9 is lightest
	var reverseOrder = 0; // By default the values will be colored highest to lowest; set this to true to color lowest to highest 
	var position = 0;
	var x = 0;
	var R = "";
	var G = "";
	var B = "";
	var shft = 0;
	if(ArrayLen(arguments) GTE 2 AND isnumeric(arguments[2])) {
		minval = val(arguments[2]);
	}
	if(ArrayLen(arguments) GTE 3 AND val(arguments[3])) {
		maxval = val(arguments[3]);
	}
	if(ArrayLen(arguments) GTE 4 AND arguments[4] IS 'roygbiv') {
		colorStyle = arguments[4];
	}
	if(ArrayLen(arguments) GTE 5 AND val(arguments[5]) GTE 0 AND val(arguments[5]) LTE 0.9) {
		lightness = val(arguments[5]);
	}
	if(ArrayLen(arguments) GTE 6 AND val(arguments[6])) {
		reverseOrder = YesNoFormat(1);
	}
	if (reverseOrder){
		x = minval;
		minval = maxval;
		maxval = x;
	}
	position = (num - minval) / (maxval - minval);
	shft = position + 0.2 + 5.5*(1-position);
	if (colorStyle IS 'roygbiv'){
		shft = 0.5*position + 1.7*(1-position);
	}
	x = shft + position * (2*Pi());	
	if (colorStyle NEQ 'roygbiv'){	
		x = x * -1;
	}
	R = INT((cos(x) + 1) * 128);
	R = Ucase(FormatBaseN(INT(R + lightness * (256 - R)),16));
	if (Len(R) IS 1){ R = "0" & R;}
	
	G = INT((cos(x+Pi()/2) + 1) * 128);
	G = Ucase(FormatBaseN(INT(G + lightness * (256 - G)),16));
	if (Len(G) IS 1){ G = "0" & G;}
	
	B = INT((cos(x+Pi()) + 1) * 128);
	B = Ucase(FormatBaseN(INT(B + lightness * (256 - B)),16));
	if (Len(B) IS 1){ B = "0" & B;}
	
	return '##' & R & G & B;
}
</cfscript>