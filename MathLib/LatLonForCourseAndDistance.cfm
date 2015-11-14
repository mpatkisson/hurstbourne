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
 * Calculates the latitude and longitude for a given latitude, longitude, true course and distance in nautical miles.
 * This function uses forumlae from Ed Williams Aviation Foundry website at http://williams.best.vwh.net/avform.htm.
 * 
 * @param lat1 	 Latitude of the first point in degrees. (Required)
 * @param lon1 	 Longitude of the first point in degrees. (Required)
 * @param tcl 	 True course. (Required)
 * @param d 	 Distance in nuatical miles from lat1/lon1. (Required)
 * @return Returns a string containing the latitude and longitude. 
 * @author Tom Nunamaker (tom@toshop.com) 
 * @version 1, May 16, 2002 
 */
function LatLonForCourseAndDistance(lat1,lon1,tc,d) {
	var lat = 1;
	var lon = 1;

	tc = tc * pi() / 180;
	d = d * pi()/(180*60);
	lat1 = lat1 * pi()/180;
	lon1 = lon1 * pi()/180;  
	lat = asin(sin(lat1)*cos(d)+cos(lat1)*sin(d)*cos(tc));
  
	if (abs(lat) IS pi()/2) lon = lon1;
	else lon = properMod(lon1-asin(sin(tc)*sin(d)/cos(lat))+pi(),2*pi()) - pi() ;

	lat = lat * 180/pi();
	lon = lon * 180/pi();
	
	return lat & "," & lon;
}
</cfscript>