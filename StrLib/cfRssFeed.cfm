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
 Display rss feed.
 Changes by Raymond Camden and Steven (v2 support amount)
 
 @param feedURL 	 RSS URL. (Required)
 @param amount 	 Restricts the amount of items returned. Defaults to number of items in the feed. (Optional)
 @return Returns a query. 
 @author Jose Diaz-Salcedo (bleachedbug@gmail.com) 
 @version 2, November 20, 2008 
--->
<cffunction name="cfRssFeed" access="public" returntype="query" output=false>
	<cfargument name="feedUrl" type="string" required="true"/>
	<cfset var news_file = arguments.feedurl>
	<cfset var rss = "">
	<cfset var items = "">
	<cfset var rssItems = "">
	<cfset var i = "">
	<cfset var row = "">
	<cfset var title = "">
	<cfset var link = "">
	
	<cfhttp url="#news_file#" method="get" />
	
	<cfset rss = xmlParse(cfhttp.filecontent)>

	<cfset items = xmlSearch(rss, "/rss/channel/item")>
	<cfset rssItems = queryNew("title,description,link")>

	<cfloop from="1" to="#ArrayLen(items)#" index="i">
		<cfset row = queryAddRow(rssItems)>
		<cfset title = xmlSearch(rss, "/rss/channel/item[#i#]/title")>

		<cfif arrayLen(title)>
			<cfset title = title[1].xmlText>
		<cfelse>
			<cfset title="">
		</cfif>

		<cfset description = XMLSearch(items[i], "/rss/channel/item[#i#]/description")>

		<cfif ArrayLen(description)>
			<cfset description = description[1].xmlText>
		<cfelse>
			<cfset description="">
		</cfif>

		<cfset link = xmlSearch(items[i], "/rss/channel/item[#i#]/link")>

		<cfif arrayLen(link)>
			<cfset link = link[1].xmlText>
		<cfelse>
			<cfset link="">
		</cfif>

		<cfset querySetCell(rssItems, "title", title, row)>
		<cfset querySetCell(rssItems, "description", description, row)>
		<cfset querySetCell(rssItems, "link", link, row)>

	</cfloop>

	<cfreturn rssItems />

</cffunction>