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
 Turns a decimal number into a reduced fraction.
 
 @param decimalNumber 	 number to turn into reduced fraction (Required)
 @return Returns a string. 
 @author Melissa Newlin (cyborgirlx@yahoo.com) 
 @version 0, April 7, 2010 
--->
<cffunction name="makeFraction" output="no" returntype="string" hint="turns a decimal number into a fraction">
	<cfargument name="decimalNumber" type="numeric" required="yes">
	<cfset var x=0>
	<cfset var numerator = ListLast(ARGUMENTS.decimalNumber,".")>
	<cfset var numeratorLength = Len(numerator)>
	<cfset var numFactors = "">
	<cfset var denomFactors = "">
	<cfset var denominator = 1>
	<cfset var GCD = 0>


	<cfloop from="1" to="#numeratorlength#" index="x">
		<cfset denominator = Evaluate(denominator & "0")>
	</cfloop>

	<!--- find factors of numerator --->
	<cfset x = 1>

	<cfloop condition="x NEQ numerator + 1">
		<cfif numerator MOD x EQ 0>
			<cfset numFactors = ListAppend(numFactors, x)>
		</cfif>
		<cfset x = x + 1>
	</cfloop>

	<!--- find factors of denominator --->
	<cfset x = 1>

	<cfloop condition="x NEQ denominator + 1">
		<cfif denominator MOD x EQ 0>
			<cfset denomFactors = ListAppend(denomFactors, x)>
		</cfif>
		<cfset x = x + 1>
	</cfloop>


	<!--- find greatest common divisor --->
	<cfset x = ListLen(numFactors)>

	<cfloop condition="GCD EQ 0">
		<cfif denomFactors CONTAINS ListGetAt(numFactors,x)>
			<cfset GCD = ListGetAt(numFactors,x)>
		<cfelse>
			<cfset x = x - 1>
		</cfif>
	</cfloop>

	<!--- set the "fractionalized" number --->
	<cfset numerator = numerator / GCD>
	<cfset denominator = denominator / GCD>

	<cfreturn "#ListFirst(ARGUMENTS.decimalNumber,".")# #numerator#/#denominator#">

</cffunction>