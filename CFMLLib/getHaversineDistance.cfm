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
 * Calculates distance between Latitude/Longitude points using haversine formula.
 * 
 * @param lat1 	 latitude of first point (Required)
 * @param lon1 	 longitude of first point (Required)
 * @param lat2 	 latitude of second point (Required)
 * @param lon2 	 longitude of second point (Required)
 * @param units 	 Units for return value. Default is miles. (Optional)
 * @return Returns numeric distance between the two points. Units varies, default is miles. 
 * @author Henry Ho (henryho167@gmail.com) 
 * @version 0, March 13, 2011 
 */
function getDistance(lat1, lon1, lat2, lon2, units = 'miles')
{
	// earth's radius. Default is miles.
	var radius = 3959;
	if (arguments.units EQ 'kilometers' )
		radius = 6371;
	else if (arguments.units EQ 'feet')
		radius = 20903520;
	
	var toRad = pi() / 180;
	var dLat = (lat2-lat1) * toRad;
	var dLon = (lon2-lon1) * toRad; 
	var a = sin(dLat/2)^2 + cos(lat1 * toRad) * cos(lat2 * toRad) * sin(dLon/2)^2; 
	var c = 2 * createObject("java","java.lang.Math").atan2(sqr(a), sqr(1-a));
	
	return radius * c;
}
</cfscript>