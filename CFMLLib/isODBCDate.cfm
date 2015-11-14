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

<!---
 Checks if a string is an ODBC formatted date, time, or timestamp
 version 0.1 by Paul Klinkenberg
 version 1.0 by Adam Cameron - adding date validation so it will fail invalid dates such as Feb 31.
 
 @param str 	 The string to validate (Required)
 @return True if the string is a correctly-formatted ODBC date string, otherwise false 
 @author Paul Klinkenberg (pauL@ongevraagdadvies.nl) 
 @version 1, July 24, 2012 
--->
<cffunction name="isODBCDate" access="public" returntype="boolean" output="false">
	<cfargument name="str" required="yes" type="string">
	<cfscript>
		// test the format
		if (!(len(str) gt 10 and refindNoCase("^\{(d|t|ts) \'([1-3][0-9]{3}\-[0-1][0-9]\-[0-3][0-9] ?)?([0-2][0-9]:[0-5][0-9]:[0-5][0-9])?\'\}$", str))){
			return false;
		}
		// test that it's actually a valid date (ie: not 31 Feb, etc)
		try {
			parseDateTime(str);
			return true;
		}
		catch (any e){
			return false;
		}
	</cfscript>
</cffunction>