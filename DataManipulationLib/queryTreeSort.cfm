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
 QueryTreeSort takes a query and efficiently (O(n)) resorts it hierarchically (parent-child), adding a Depth column that can then be used when displaying the data.
 
 @param stuff 	 Query to sort. (Required)
 @param parentid 	 Column containing parent id. Defaults to parentid. (Optional)
 @param itemid 	 Column containing ID value. Defaults to itemid. (Optional)
 @param basedepth 	 Base depth of data. Defaults to 0. (Optional)
 @param depthname 	 Name for new column to use for depth. Defaults to TreeDepth. (Optional)
 @return Returns a query. 
 @author Rick Osborne (deliver8r@gmail.com) 
 @version 1, April 9, 2007 
--->
<cffunction name="queryTreeSort" returntype="query" output="No">
	<cfargument name="Stuff" type="query" required="Yes">
	<cfargument name="ParentID" type="string" required="No" default="ParentID">
	<cfargument name="ItemID" type="string" required="No" default="ItemID">
	<cfargument name="BaseDepth" type="numeric" required="No" default="0">
	<cfargument name="DepthName" type="string" required="No" default="TreeDepth">
	<cfset var RowFromID=StructNew()>
	<cfset var ChildrenFromID=StructNew()>
	<cfset var RootItems=ArrayNew(1)>
	<cfset var Depth=ArrayNew(1)>
	<cfset var ThisID=0>
	<cfset var ThisDepth=0>
	<cfset var RowID=0>
	<cfset var ChildrenIDs="">
	<cfset var ColName="">
	<cfset var Ret=QueryNew(ListAppend(Stuff.ColumnList,Arguments.DepthName))>
	<!--- Set up all of our indexing --->
	<cfloop query="Stuff">
		<cfset RowFromID[Stuff[Arguments.ItemID][Stuff.CurrentRow]]=CurrentRow>
		<cfif NOT StructKeyExists(ChildrenFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
			<cfset ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]]=ArrayNew(1)>
		</cfif>
		<cfset ArrayAppend(ChildrenFromID[Stuff[Arguments.ParentID][Stuff.CurrentRow]], Stuff[Arguments.ItemID][Stuff.CurrentRow])>
	</cfloop>
	<!--- Find parents without rows --->
	<cfloop query="Stuff">
		<cfif NOT StructKeyExists(RowFromID, Stuff[Arguments.ParentID][Stuff.CurrentRow])>
			<cfset ArrayAppend(RootItems, Stuff[Arguments.ItemID][Stuff.CurrentRow])>
			<cfset ArrayAppend(Depth, Arguments.BaseDepth)>
		</cfif>
	</cfloop>
	<!--- Do the deed --->
	<cfloop condition="ArrayLen(RootItems) GT 0">
		<cfset ThisID=RootItems[1]>
		<cfset ArrayDeleteAt(RootItems, 1)>
		<cfset ThisDepth=Depth[1]>
		<cfset ArrayDeleteAt(Depth, 1)>
		<cfif StructKeyExists(RowFromID, ThisID)>
			<!--- Add this row to the query --->
			<cfset RowID=RowFromID[ThisID]>
			<cfset QueryAddRow(Ret)>
			<cfset QuerySetCell(Ret, Arguments.DepthName, ThisDepth)>
			<cfloop list="#Stuff.ColumnList#" index="ColName">
				<cfset QuerySetCell(Ret, ColName, Stuff[ColName][RowID])>
			</cfloop>
		</cfif>
		<cfif StructKeyExists(ChildrenFromID, ThisID)>
			<!--- Push children into the stack --->
			<cfset ChildrenIDs=ChildrenFromID[ThisID]>
			<cfloop from="#ArrayLen(ChildrenIDs)#" to="1" step="-1" index="i">
				<cfset ArrayPrepend(RootItems, ChildrenIDs[i])>
				<cfset ArrayPrepend(Depth, ThisDepth + 1)>
			</cfloop>
		</cfif>
	</cfloop>
	<cfreturn Ret>
</cffunction>