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
 * Converts a decimal Lat/Long coordinate into sexagesimal (degrees, minutes, seconds).
 * 
 * @param pCoordinate 	 Decimal coordinate. 
 * @param pCoordinatePart 	 Coordinate part requested. Can be: degree(s),minute(s),second(s) 
 * @return Returns a string. 
 * @author Christopher Tackett (cflib@tackettproxy.com) 
 * @version 1, April 23, 2002 
 */
Function Decimal2Sexagesimal(pCoordinate) {
	var pCoordinatePart = "";
	var myDegrees = "";
	var myMinutes = "";
	var mySeconds = "";
	var retval = "";
	
	myDegrees = Int(pCoordinate);
	myMinutes = (pCoordinate - Int(pCoordinate)) * 60;
	mySeconds = (myMinutes - Int(myMinutes)) * 60;
	
	mySeconds = Round(mySeconds * 10000) / 10000;
	
	if (mySeconds eq 60) {
		myMinutes = myMinutes + 1;
		if (myMinutes eq 60) {
			myDegrees = myDegrees + 1;
			myMinutes = 0;
		}
		mySeconds = 0;
	}
	
	retval = myDegrees & chr(176) & " " & Int(myMinutes) & "' " & mySeconds & chr(34);
	
	if (ArrayLen(Arguments) gt 1) {
	
		pCoordinatePart = Arguments[2];
		
		if (pCoordinatePart eq "degree" or pCoordinatePart eq "degrees" or pCoordinatePart eq 1)
			retval = myDegrees;
		else if (pCoordinatePart eq "minute" or pCoordinatePart eq "minutes" or pCoordinatePart eq 2)
			retval = Int(myMinutes);
		else if (pCoordinatePart eq "second" or pCoordinatePart eq "seconds" or pCoordinatePart eq 3)
			retval = mySeconds;
			
	}
	
	return retval;

}
</cfscript>