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
 * This function calculates the wind chill based upon the new NWS Wind Chill Index calculations.
 * 
 * @param intAirTemperature 	 Temperature 
 * @param intWindSpeed 	 Wind speed in MPH 
 * @return Returns the wind chill. 
 * @author Russel Madere (rmadere@turbosquid.com) 
 * @version 1, August 22, 2001 
 */
function CalculateWindChill(intAirTemperature, intWindSpeed)
{

    return Round(35.74 + (0.6215 * intAirTemperature) - (35.75 * (intWindSpeed ^ 0.16)) + (0.4275 * intAirTemperature * (intWindSpeed ^ 0.16)));

}
</cfscript>