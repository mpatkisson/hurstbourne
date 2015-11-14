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
 Generates a valid Site Map XML from either a list of URLs or a query of URLs.
 
 @param data 	 Either a list of URLs or a query. (Required)
 @param lastmod 	 Date to use for all URLs as their lastmod property. If not passed, the value will not be used in the XML unless a query is used and the column lastmod exists. (Optional)
 @param changefreq 	 Value to use for all URLs as their changefreq property. If not passed, the value will not be used in the XML unless a query is used and the column changefreq exists. (Optional)
 @param priority 	 Value to use for all URLs as their priority property. If not passed, the value will not be used in the XML unless a query is used and the column priority exists. (Optional)
 @return Returns a string. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 2, August 14, 2007 
--->
<cffunction name="generateSiteMap" output="false" returnType="string">
	<cfargument name="data" type="any" required="true">
	<cfargument name="lastmod" type="date" required="false">
	<cfargument name="changefreq" type="string" required="false">
	<cfargument name="priority" type="numeric" required="false">
	
	<cfset var header = "<?xml version=""1.0"" encoding=""UTF-8""?><urlset xmlns=""http://www.sitemaps.org/schemas/sitemap/0.9"">">
	<cfset var s = createObject('java','java.lang.StringBuffer').init(header)>
	<cfset var aurl = "">
	<cfset var item = "">
	<cfset var validChangeFreq = "always,hourly,daily,weekly,monthly,yearly,never">
	<cfset var newDate = "">
	<cfset var tz = getTimeZoneInfo().utcHourOffset>
	<cfset var btz = replaceList(tz, "+,-","")>
	
	<cfif structKeyExists(arguments, "changefreq") and not listFindNoCase(validChangeFreq, arguments.changefreq)>
		<cfthrow message="Invalid changefreq (#arguments.changefreq#) passed. Valid values are #validChangeFreq#">
	</cfif>

	<cfif structKeyExists(arguments, "priority") and (arguments.priority lt 0 or arguments.priority gt 1)>
		<cfthrow message="Invalid priority (#arguments.priority#) passed. Must be between 0.0 and 1.0">
	</cfif>
	
	<!--- reformat datetime as w3c datetime / http://www.w3.org/TR/NOTE-datetime --->
	<cfif structKeyExists(arguments, "lastmod")>			
		<cfset newDate = dateFormat(arguments.lastmod, "YYYY-MM-DD") & "T" & timeFormat(arguments.lastmod, "HH:mm")>
		<cfif tz gt 0>
			<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
		<cfelse>
			<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
		</cfif>		
	</cfif>
	
	<!--- Support either a query or list of URLs --->
	<cfif isSimpleValue(arguments.data)>
		<cfloop index="aurl" list="#arguments.data#">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(aurl)#</loc>
					<cfif structKeyExists(arguments,"lastmod")>
					<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif structKeyExists(arguments,"changefreq")>
					<changefreq>#arguments.changefreq#</changefreq>
					</cfif>
					<cfif structKeyExists(arguments,"priority")>
					<priority>#arguments.priority#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		</cfloop>
	<!--- url, lastmod, changefreq, and priority were changed to have the arguments.data.whatever and I also added the array notation to each like so [arguments.data.currentrow] --->
	<cfelseif isQuery(arguments.data)>
		<cfloop query="arguments.data">
			<cfsavecontent variable="item">
				<cfoutput>
				<url>
					<loc>#xmlFormat(arguments.data.url[arguments.data.currentrow])#</loc>
					<cfif listFindNoCase(arguments.data.columnlist,"lastmod")>
						<cfset newDate = dateFormat(arguments.data.lastmod[arguments.data.currentrow], "YYYY-MM-DD") & "T" & timeFormat(arguments.data.lastmod[arguments.data.currentrow], "HH:mm")>
						<cfif tz gt 0>
							<cfset newDate = newDate & "-" & numberFormat(btz,"00") & ":00">
						<cfelse>
							<cfset newDate = newDate & "+" & numberFormat(btz,"00") & ":00">
						</cfif>		
						<lastmod>#newDate#</lastmod>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"changefreq")>
					<changefreq>#arguments.data.changefreq[arguments.data.currentrow]#</changefreq>
					</cfif>
					<cfif listFindNoCase(arguments.data.columnlist,"priority")>
					<priority>#arguments.data.priority[arguments.data.currentrow]#</priority>
					</cfif>
				</url>
				</cfoutput>
			</cfsavecontent>
			<cfset item = trim(item)>
			<cfset s.append(item)>
		
		</cfloop>
	</cfif>	
	<cfset s.append("</urlset>")>

	<cfreturn s>
	
</cffunction>