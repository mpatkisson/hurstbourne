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
 * Returns the total number of seconds from midnight for a valid date/time object.
 * Note that this function returns different results depending on whether the date/time object you pass it has seconds defined.
 * 
 * v2 bug fix by Steven Van Gemert
 * 
 * @param timeObject 	 Valid date/time object. (Required)
 * @return Returns a numeric value. 
 * @author Alan McCollough (kittycat@kittycatonline.com) 
 * @version 2, July 16, 2008 
 */
function getSecondsFromTime(timeObject){
  var theSeconds = Val(Hour(timeObject) * 3600) + Val(Minute(timeObject) * 60) + Second(timeObject);
  return theSeconds;
}
</cfscript>