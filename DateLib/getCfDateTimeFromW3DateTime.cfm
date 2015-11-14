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
 Takes a W3 date and returns a CF datetime.
 
 @param dts 	 Datetime string. (Required)
 @return Returns a date. 
 @author Jared Rypka-Hauer (jared@web-relevant.com) 
 @version 1, August 2, 2006 
--->
<cffunction name="getCfDateTimeFromW3DateTime" access="public" returntype="string" output="false">
    <cfargument name="dts" type="string" required="true" />
    <cfif left(dts,1) is "(">
        <cfset dts = mid(dts,2,len(dts)-2)>
    </cfif>
    <cfset dts = listToArray(reReplace(dts,"(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2})(\D)?(\d{2})?(:00)?","\2/\3/\1 \4:\5:\6;\7;\8"),";")>
    <cfif arrayLen(dts) IS 2>
        <cfreturn createDateTime(year(dts[1]),month(dts[1]),day(dts[1]),hour(dts[1]),minute(dts[1]),second(dts[1])) />
    <cfelse>
        <cfif dts[2] is "-">
            <cfreturn dateAdd("h",0-listFirst(dts[3],":"),dts[1]) />
        <cfelse>
            <cfreturn dateAdd("h",listFirst(dts[3],":"),dts[1]) />
        </cfif>
    </cfif>
</cffunction>