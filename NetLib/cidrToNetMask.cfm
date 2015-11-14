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
 * Converts CIDR numbers to valid network mask numbers.
 * 
 * @param cidr 	 CIDR number. (Required)
 * @return Returns a string. 
 * @author Sufiyan bin Yasa (cinod_79@yahoo.com) 
 * @version 1, July 19, 2005 
 */
function cidrToNetMask (cidr) {
	var netMask = "";	

	var post = 0;
	var remainder = cidr MOD 8;
	var divide = cidr \ 8;

	while(divide gt 0) {
		netMask = listAppend(netMask, 255,'.'); 
		divide = divide - 1;
		post = post + 1;		
	}

	if(remainder gt 0) {			
		netMask = listAppend(NetMask,
				  bitSHLN(BitOr(0,2^remainder-1), 8-remainder),
				  '.'); 		
		post = post +1;			
	}

	while(post lt 4) {
		netMask = listAppend(netMask, "0",'.'); 			
		post = post + 1;
	}
	
	if(right(netMask, 1) eq "."){		
		netMask = left(netMask,len(netMask));
	}
	return netMask;
}
</cfscript>