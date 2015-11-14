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
 Returns a 'golden birthday', or the date when your birthday day of month equals your age.
 
 @param birthday 	 The date of birth. (Required)
 @return Returns a date. 
 @author Joshua Siok (jsiok@smp.org) 
 @version 0, April 30, 2009 
--->
<cffunction name="goldenBirthday" access="public" returntype="date">
	<cfargument name="birthDate" type="date" required="yes">
	<cfreturn dateAdd("yyyy", day(birthDate),birthDate)>
</cffunction>