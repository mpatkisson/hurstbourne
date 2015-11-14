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
 Returns a struct with the bank holidays of Germany
 
 @param iYear 	 Defaults to current year (Optional)
 @return Returns a struct 
 @author Sigi Heckl (siegfried.heckl@siemens.com) 
 @version 0, March 13, 2011 
--->
<cffunction name="getBankHolidays" access="public" output="false" returntype="struct" hint="general bank holidays for DE">
  <cfargument name="iYear" type="numeric" default="#datepart('yyyy',now())#" hint="year for calculation" />

    //definition of constant holidays
    <cfset var strResult = {newyear     = createDate(arguments.iYear,1,1),
                            dayOfWork   = createDate(arguments.iYear,5,1),
                            christmas1  = createDate(arguments.iYear,12,25),
                            christmas2  = createDate(arguments.iYear,12,26),
                            nationalDay = createDate(arguments.iYear,10,3)
                           } />
    <cfset var local     = {} />

    //easter formula to get variable holidays
    <cfset local.k  = round(arguments.iYear / 100) />
    <cfset local.m  = 15 + round((3*local.k +3)/4) - round((8*local.k+13)/25) />
    <cfset local.s  = 2 - round((3*local.k+3)/4) />
    <cfset local.a  = arguments.iYear mod 19 />
    <cfset local.d  = (19*local.a+local.m) mod 30 />
    <cfset local.r  = round((local.d + round(local.a/11))/29) />
    <cfset local.og = 21 + local.d - local.r />
    <cfset local.sz = 7 - (arguments.iYear + round(arguments.iYear/4) + local.s) mod 7 />
    <cfset local.oe = 7 - (local.og-local.sz) mod 7 />
    <cfset local.os = local.og + local.oe />
    <cfset local.om = 3 />
    <cfif local.os GT 31>
      <cfset local.os = local.os - 31 />
      <cfset local.om = 4 />
    </cfif>

    <cfset local.easterSunday    = createDate(arguments.iYear, local.om, local.os) />
    <cfset strResult.osterMonday = dateAdd('d',1,local.easterSunday) />
    <cfset strResult.goodFriday  = dateAdd('d',-2,local.easterSunday) />
    <cfset strResult.whitsun     = dateAdd('d',50,local.easterSunday) />
    <cfset strResult.ascension   = dateAdd('d',39,local.easterSunday) />

    <CFRETURN strResult />
</cffunction>