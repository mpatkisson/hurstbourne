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
 * Will take a number returned from a File.Filesize, calculate the number in terms of Bytes/Kilobytes/Megabytes and return the result.
 * v2 by Haikal Saadh
 * v3 by Michael Smith, cleaned up and added Gigabytes
 * 
 * @param number 	 Size in bytes of the file. (Required)
 * @return Returns a string. 
 * @author Kyle Morgan (admin@kylemorgan.com) 
 * @version 3, February 3, 2009 
 */
function fncFileSize(size) {
	if (size lt 1024) return "#size# b";
	if (size lt 1024^2) return "#round(size / 1024)# Kb";
	if (size lt 1024^3) return "#decimalFormat(size/1024^2)# Mb";
	return "#decimalFormat(size/1024^3)# Gb";
}
</cfscript>