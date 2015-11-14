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
 * Calculates the area of an irregular N sided Polygon.
 * 
 * @param data 	 Array of structs (Required)
 * @return Returns a number. 
 * @author Tim Dudek (tim@igl.net) 
 * @version 1, January 26, 2004 
 */
function CalcPolygonArea(data) {
	var area = "0";
	var i = 1;

	// Check for valid Stucture with at least 3 records
	if(not isArray(data) or arrayLen(data) lte 2) return 0;
	
	data[arrayLen(data)+1] = structNew();
	data[arrayLen(data)].x = data[1].x;
	data[arrayLen(data)].y = data[1].y;
	

	// Loop through the structure performing the area calculation.
	// Formula = Area = 1/2 * ((x1+x2)(y1-y2)+(x2+x3)(y2-y3)+...+(xn+x1)(yn-y1))
	for(; i LT arrayLen(data) ; i=i+1) {
		area = area + ( data[i+1].x-data[i].x) * (data[i+1].y + data[i].y) / 2;
	}
	
	// Only return positive values.
	return abs(area);
}
</cfscript>