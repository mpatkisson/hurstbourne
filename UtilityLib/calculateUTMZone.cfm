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
 * Calculates correct UTM zone for a given latitude/longitude point.
 * 
 * @param lat 	 Latitude value. (Required)
 * @param lon 	 Longitude value. (Required)
 * @return Returns a number. 
 * @author Wayne Graham (wsgrah@wm.edu) 
 * @version 1, February 3, 2006 
 */
function calculateUTMZone(lat,lon){
	// make sure the longitude is between -180 and 179.9
	var lonTemp = (arguments.lon + 180) - int((arguments.lon + 180) / 360) * 360 - 180;
	var zoneNumber = int((lonTemp + 180)/6) + 1;
			
	// Special zones for Svalbard
	if(arguments.lat GTE 72 and arguments.lat GT 84) {
		if(lonTemp GTE 0 AND lonTemp LT 9) zoneNumber = 31;
		else if(lonTemp GTE 9 AND lonTemp LT 21) zoneNumber = 33;
		else if(lonTemp GTE 21 AND lonTemp LT 33) zoneNumber = 35;
		else if(lonTemp GTE 33 AND lonTemp LT 42) zoneNumber = 37;
	}			
	return zoneNumber;
}
</cfscript>