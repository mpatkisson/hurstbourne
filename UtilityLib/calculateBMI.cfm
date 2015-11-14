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
 Calculates the Body Mass Index.
 
 @param weightlbs 	 Weight in pounds. (Required)
 @param heightinches 	 Height in inches. (Required)
 @return Returns a number. 
 @author Elyse Nielsen (Elyse@anticlue.net) 
 @version 1, April 14, 2005 
--->
<cffunction name="calculateBMI" returntype="numeric" hint="This function calculates an individuals Body Mass Index">
	<cfargument name="WeightLbs" type="numeric" required="yes" hint="The person's weight in pounds">
	<cfargument name="HeightInches" type="numeric" required="yes" hint="The person's height in inches">
	<cfset var HI2 = "">
	<cfset var WHI = "">
	<cfset var BMI = "">
	<cfset HI2 = HeightInches * HeightInches>
	<cfset WHI = WeightLbs / HI2>
	<cfset BMI = WHI * 703>
	<cfreturn decimalFormat(BMI)>
</cffunction>