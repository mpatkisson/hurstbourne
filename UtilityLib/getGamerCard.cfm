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
 This function will return information about a user's XBox Live status.
 
 @param tag 	 Username for the account. (Required)
 @return Returns a structure. 
 @author Raymond Camden (ray@camdenfamily.com) 
 @version 1, January 18, 2007 
--->
<cffunction name="getGamerCard" output="false" returnType="struct">
	<cfargument name="tag" type="string" required="true">
	<cfset var result = structNew()>
	<cfset var theURL = "http://gamercard.xbox.com/#arguments.tag#.card">
	<cfset var httpResult = "">
	<cfset var gameblock = "">
	<cfset var foundImg = "">
	<cfset var img = "">
	<cfset var title = "">
	
	<cfset result.games = arrayNew(1)>
		
	<cfhttp url="#theURL#" result="httpResult">
	<cfset httpResult = httpResult.fileContent>
	
	<!--- first get the xboxlive level --->
	<cfset result.level = rereplace(httpResult, ".*XbcGamertag(.*?)"".*", "\1")>
	
	<!--- get gamertile --->
	<cfset result.gamertileimg = rereplace(httpResult, ".*(<img class=""XbcgcGamertile"" .*?>).*","\1")>
	<cfset result.gamertileimg = rereplace(result.gamertileimg, ".*src=""(.*?)"".*", "\1")>

	<!--- set url --->
	<cfset result.memberurl = "http://live.xbox.com/member/#arguments.tag#">
	
	<!--- gamer scope pattern:
	<img alt="Gamerscore" src="/xweb/lib/images/G_Icon_External.gif" /></span><span class="XbcFRAR">3095</span>
	--->
	<cfset result.gamerscore = rereplace(httpResult,".*<img alt=""Gamerscore"".*?<span class=""XbcFRAR"">([0-9]+).*","\1")>

	<!--- get ths block of links/images for recent games --->
	<cfset gameblock = rereplace(httpResult, ".*<div class=""XbcgcGames"">(.*?)</div>.*", "\1")>
	<cfset foundImg = reFind("<img", gameblock)>
	<!--- get all images in this block --->
	<cfloop condition="foundImg">
		<cfset img = reFindNoCase("(<img.*?>)",gameblock,1,1)>
		<cfif img.pos[1] gte 1>
			<cfset imgStr = mid(gameblock, img.pos[1], img.len[1])>
			<!--- now get the title --->
			<cfset title = rereplace(imgstr, ".*title=""(.*?)"".*", "\1")>
			<cfset arrayAppend(result.games, title)>
			<cfset gameblock = replace(gameblock, imgstr, "")>			
			<cfset foundImg = reFind("<img", gameblock)>
		</cfif>
	</cfloop>
	
	<cfreturn result>
	
</cffunction>