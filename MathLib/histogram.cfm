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
 * Bins the elements of an array into equally spaced containers and returns the number of elements in each container.
 * 
 * @param y 	 Array of numbers. (Required)
 * @param low 	 Lowest container midpoint. (Optional)
 * @param hi 	 Highest container midpint. (Optional)
 * @param num 	 Number of containers. (Optional)
 * @return Returns an array. 
 * @author Paul Dragos (dragosp@battelle.org) 
 * @version 1, January 2, 2007 
 */
function histogram(y) {
	// Declarations
	var m = ArrayNew(1);	// array of bin Midpoints
	var b = ArrayNew(1);	// array of bin Boundaries
	var n = ArrayNew(1);	// array of Number of points in each bin
	var x = ArrayNew(2);	// 2-d array containing m and n above (returned)
	var i=1; 
	var j=1; 
	// Size of y
	var len = arrayLen(y);
	// Set the default upper and lower limits and number of bins
	var miny = arrayMin(y);
	var maxy = arrayMax(y);
	var nbins = 10;
	var binwidth = 1;
	// Set the limits if not using the defaults
	if(arrayLen(arguments) gte 2) {
    	miny = arguments[2];
    	maxy = arguments[3];
    	nbins = arguments[4];
 	}
	// Set the bin width
	binwidth = (maxy - miny) / (nbins-1);
	// Set the bin midpoints
	for(i=1; i LTE nbins; i=i+1) {
		m[i] = miny + (binwidth * (i-1));
    }
	// Set the bin boundaries
	for(i=1; i LTE (nbins+1); i=i+1) {
		b[i] = miny - (binwidth / 2) + (binwidth * (i-1));
    }
	// Count the number in each bin
	for(i=1; i LTE nbins; i=i+1) {
		n[i] = 0;  
	}
	for(j=1; j LTE len; j=j+1) {
		for(i=1; i LTE nbins; i=i+1) {
			if(y[j] GTE b[i] AND y[j] LT b[i+1] ) 
			{
				n[i] = n[i] + 1;
			}
		}
    }
	for(i=1; i LTE nbins; i=i+1) 
	{  
		x[1][i] = m[i];  
		x[2][i] = n[i];  
	}
    return x;
}
</cfscript>