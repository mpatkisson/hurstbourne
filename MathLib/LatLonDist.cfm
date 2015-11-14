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
 * Calculates the distance between two latitudes and longitudes.
 * This funciton uses forumlae from Ed Williams Aviation Foundry website at http://williams.best.vwh.net/avform.htm.
 * 
 * @param lat1 	 Latitude of the first point in degrees. (Required)
 * @param lon1 	 Longitude of the first point in degrees. (Required)
 * @param lat2 	 Latitude of the second point in degrees. (Required)
 * @param lon2 	 Longitude of the second point in degrees. (Required)
 * @param units 	 Unit to return distance in. Options are: km (kilometers), sm (statute miles), nm (nautical miles), or radians.  (Required)
 * @return Returns a number or an error string. 
 * @author Tom Nunamaker (tom@toshop.com) 
 * @version 1, May 14, 2002 
 */
function LatLonDist(lat1,lon1,lat2,lon2,units)
{
  // Check to make sure latitutdes and longitudes are valid
  if(lat1 GT 90 OR lat1 LT -90 OR
     lon1 GT 180 OR lon1 LT -180 OR
     lat2 GT 90 OR lat2 LT -90 OR
     lon2 GT 280 OR lon2 LT -280) {
    Return ("Incorrect parameters");
  }

  lat1 = lat1 * pi()/180;
  lon1 = lon1 * pi()/180;
  lat2 = lat2 * pi()/180;
  lon2 = lon2 * pi()/180;
  UnitConverter = 1.150779448;  //standard is statute miles
  if(units eq 'nm') {
    UnitConverter = 1.0;
  }
  
  if(units eq 'km') {
    UnitConverter = 1.852;
  }
  
  distance = 2*asin(sqr((sin((lat1-lat2)/2))^2 + cos(lat1)*cos(lat2)*(sin((lon1-lon2)/2))^2));  //radians
  
  if(units neq 'radians'){
    distance = UnitConverter * 60 * distance * 180/pi();
  }
  
  Return (distance) ;
}
</cfscript>