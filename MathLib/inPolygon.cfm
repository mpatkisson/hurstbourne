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
 I check if a point is inside of a polygon.
 
 @param polygonXCoordinates 	 I am a list of X coordinates that make the polygon. I default to an empty string. (Optional)
 @param polygonYCoordinates 	 I am a list of Y coordinates that make the polygon. I default to an empty string. (Optional)
 @param pointX 	 I am the x coordinate of the point to check. I default to an empty string. (Optional)
 @param pointY 	 I am the y coordinate of the point to check.  I default to an empty string. (Optional)
 @return Returns a boolean. 
 @author John Allen (jallen@figleaf.com) 
 @version 1, October 22, 2010 
--->
<cffunction name="inPolygon" output="false" returntype="boolean" access="public" 
	displayname="In Polygon" hint="I check if a point is inside of a polygon."
	description="I check if the passed in pointX and pointY are inside of a the passed in polygon coordinates.">
	
	<cfargument name="polygonXCoordinates" type="any" default=""
		hint="I am a list of X coordinates that make the polygon. I default to an empty string." />
	<cfargument name="polygonYCoordinates" type="any" default=""
		hint="I am alist of Y coordinates that make the polygon. I default to an empty string." />
	<cfargument name="pointX" type="any" default=""
		hint="I am the x coordinate of the point to check. I default to an empty string." />
	<cfargument name="pointY" type="any" default=""
		hint="I am the y coordinate of the point to check.  I default to an empty string." />
	
	<cfset var polygon = createObject("java", "java.awt.Polygon").init() />
	<cfset var x = 0 />
	
	<cfif listLen(arguments.polygonXCoordinates) neq listLen(arguments.polygonYCoordinates)>
		<cfthrow message="The lenght of the x and y coordinates lists, used to build the Polygon, are not the same length." />
	</cfif>
	
	<!--- create the polygon object --->
	<cfloop from="1" to="#listLen(arguments.polygonXCoordinates)#" index="x">
		<cfset polygon.addPoint(
						javaCast('int', listGetAt(arguments.polygonXCoordinates, x)), 
						javaCast('int', listGetAt(arguments.polygonYCoordinates, x))) />
	</cfloop>
	
	<!--- check if the supplied x/y point is in the polygon --->
	<cfreturn polygon.contains(
						javaCast('int', arguments.pointX), 
						javaCast('int', arguments.pointY)) />
</cffunction>