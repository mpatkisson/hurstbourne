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
 * Creates a comma separated list of hex colors forming a gradient between the start color and the end color over a specified number of steps.
 * 
 * @param startcolor 	 RGB value of the initial color. (Required)
 * @param endcolor 	 RGV value of the end color. (Required)
 * @param steps 	 Number of steps for the gradient. (Required)
 * @return Returns a list. 
 * @author Adam Howitt (adamhowitt@yahoo.com) 
 * @version 1, May 22, 2003 
 */
function fadeList(startcolor,endcolor,steps) {
	var outlist=startcolor;
	var decr=0;
	var decg=0;
	var decb=0;
	var newr=0;
	var newg=0;
	var newb=0;
	var ix = 1;

	steps=steps-1;
	decr=(inputbasen(left(startcolor,2),16)-inputbasen(left(endcolor,2),16))/steps;
	decg=(inputbasen(mid(startcolor,3,2),16)-inputbasen(mid(endcolor,3,2),16))/steps;
	decb=(inputbasen(right(startcolor,2),16)-inputbasen(right(endcolor,2),16))/steps;
	for (ix=1;ix lte steps;ix=ix+1) {
		newr=formatbasen(int(inputbasen(left(startcolor,2),16)-(ix*decr)),16);
		if (len(newr) eq 1) {newr="0"&newr;}
		newg=formatbasen(int(inputbasen(mid(startcolor,3,2),16)-(ix*decg)),16);
		if (len(newg) eq 1) {newg="0"&newg;}
		newb=formatbasen(int(inputbasen(right(startcolor,2),16)-(ix*decb)),16);
		if (len(newb) eq 1) {newb="0"&newb;}
		outlist=outlist&","&newr&newg&newb;
	}
	return outlist & "," & endcolor;
}
</cfscript>