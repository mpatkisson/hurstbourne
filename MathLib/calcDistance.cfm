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
 Calculate direct distance and angle between two decimal coordinates.
 v2 update by Mike G.
 
 @param startNorth 	 Start point Latitude (Required)
 @param startEast 	 Start point Longitude (Required)
 @param endNorth 	 End point Latitude (Required)
 @param endEast 	 End point Longitude (Required)
 @param returnAsMiles 	 Boolean value that forces the return to be miles. (Optional)
 @return Returns a struct. 
 @author Sigi Heckl (siegfried.heckl@siemens.com) 
 @version 2, July 28, 2011 
--->
<cffunction name="calcDistance" access="private" output="false"
returntype="struct" hint="calculate distance between coordinates">
 <cfargument name="startLat" required="true" type="string"
hint="Start point Latitude (Dezimalschreibweise!)" />
 <cfargument name="startLon"  required="true" type="string"
hint="Start point Longitude (Dezimalschreibweise!)" />
 <cfargument name="endLat"   required="true" type="string" hint="End
point Latitude (Dezimalschreibweise!)" />
 <cfargument name="endLon"    required="true" type="string" hint="End
point Longitude (Dezimalschreibweise!)" />
 <cfargument name="returnAsMiles" required="no" type="boolean"
hint="True returns as US Miles, otherwise return is in kilometers">

 <cfset var strResult = { distance='0', angle='0', revAngle='0' } />
 <cfset var RADIUS    = 6371 />
 <cfset var rs     = structNew() />

 <cfset rs.a     = (90-arguments.startLat) * Pi() / 180 />
 <cfset rs.b     = (90-arguments.endLat)   * Pi() / 180 />
 <cfset rs.gamma = abs(arguments.endLon-arguments.startLon) * Pi() / 180 />
 <cfset rs.c     = aCos(cos(rs.a) * cos(rs.b) + sin(rs.a) * sin(rs.b)
* cos(rs.gamma)) />
 <cfset rs.s     = (rs.a + rs.b + rs.c) / 2 />
 <cfif arguments.startLon EQ arguments.endLon>
     <cfif arguments.startLat LT arguments.endLat>
         <cfset rs.alpha = Pi() />
         <cfset rs.beta  = 0 />
       <cfelse>
         <cfset rs.alpha = Pi() />
         <cfset rs.beta  = Pi() />
     </cfif>
   <cfelse>
     <cfset rs.alpha = aCos((cos(rs.a) - cos(rs.b)*cos(rs.c)) /
(sin(rs.c)*sin(rs.b))) />
     <cfset rs.beta  = aCos((cos(rs.b) - cos(rs.c)*cos(rs.a)) /
(sin(rs.c)*sin(rs.a))) />
 </cfif>

 <cfset rs.e  = rs.alpha + rs.beta + rs.gamma - Pi() />
 <cfset rs.A  = RADIUS * RADIUS * rs.e />
 <cfset rs.ss = (rs.alpha + rs.beta + rs.gamma) / 2 />
 <cfset rs.ka = rs.a * RADIUS />
 <cfset rs.kb = rs.b * RADIUS />
 <cfset rs.kc = rs.c * RADIUS />
 <cfif rs.beta NEQ 0>
     <cfset rs.bearing = 360 - (rs.beta * 180 / Pi()) />
   <cfelse>
     <cfset rs.bearing = 0 />
 </cfif>
 <cfset rs.revbearing = (rs.alpha * 180 / Pi()) />

 <cfif (arguments.endLon-arguments.startLon GT 0) OR
       ((arguments.endLon EQ arguments.startLon) AND
(arguments.endLat LT arguments.startLat))>
   <cfset rs.bearing    = 360 - rs.bearing />
   <cfset rs.revbearing = 360 - rs.revbearing />
 </cfif>

 <cfset rs.kc         = round(1000* rs.kc)/1000 />
 <cfset rs.bearing    = round(100 * rs.bearing) / 100 />
 <cfset rs.revbearing = round(100 * rs.revbearing) / 100 />

 <cfset strResult.distance  = rs.kc / >
 <cfif structkeyexists(arguments,"returnAsMiles") and arguments.returnAsMiles>
       <cfset strResult.distance  = rs.kc*0.621371192 / >
 </cfif>
 <cfset strResult.angle     = rs.bearing / >
 <cfset strResult.revAngle  = rs.revbearing / >

 <cfreturn strResult>
</cffunction>