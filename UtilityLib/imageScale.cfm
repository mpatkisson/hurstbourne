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
 * Returns width or height of a scaled image.
 * 
 * @param selector 	 Dimension to scale. Either h (for height) or w (for width). (Required)
 * @param oldHeight 	 Old height. (Required)
 * @param oldWidth 	 Old width. (Required)
 * @param newParameter 	 New size. (Required)
 * @return Returns a number. 
 * @author Greg Nettles (gregnettles@hotmail.com) 
 * @version 1, October 18, 2006 
 */
function imageScale(selector,oldHeight,oldWidth,newParameter) {
		var ratioA = oldHeight/oldWidth;
		var ratioB = oldWidth/oldHeight;
		if (selector is 'h') {
			return round(newParameter * (1/ratioA));
		} else if (selector is 'w') {
			return round(newParameter * (1/ratioB));
		}
	}
</cfscript>