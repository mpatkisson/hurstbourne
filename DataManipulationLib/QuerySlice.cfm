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
 Returns specific number of records starting with a specific row.
 Renamed by RCamden
 Version 2 with column name support by Christopher Bradford, christopher.bradford@aliveonline.com
 
 @param theQuery 	 The query to work with. (Required)
 @param StartRow 	 The row to start on. (Required)
 @param NumberOfRows 	 The number of rows to return. (Required)
 @param ColumnList 	 List of columns to return. Defaults to all the columns. (Optional)
 @return Returns a query. 
 @author Kevin Bridges (cyberswat@orlandoartistry.com) 
 @version 2, May 23, 2005 
--->
<cffunction name="QuerySliceAndDice" returntype="query" output="false">
	<cfargument name="theQuery" type="query" required="true" />
	<cfargument name="StartRow" type="numeric" required="true" />
	<cfargument name="NumberOfRows" type="numeric" required="true" />
	<cfargument name="ColumnList" type="string" required="false" default="" />
	
	<cfscript>
		var FinalQuery = "";
		var EndRow = StartRow + NumberOfRows;
		var counter = 1;
		var x = "";
		var y = "";
	
		if (arguments.ColumnList IS "") {
			arguments.ColumnList = theQuery.ColumnList;
		}
		FinalQuery = QueryNew(arguments.ColumnList);
			
		if(EndRow GT theQuery.recordcount) {
			EndRow = theQuery.recordcount+1;
		}
		
		QueryAddRow(FinalQuery,EndRow - StartRow);
		
		for(x = 1; x LTE theQuery.recordcount; x = x + 1){
			if(x GTE StartRow AND x LT EndRow) {
				for(y = 1; y LTE ListLen(arguments.ColumnList); y = y + 1) {
					QuerySetCell(FinalQuery, ListGetAt(arguments.ColumnList, y), theQuery[ListGetAt(arguments.ColumnList, y)][x],counter);
				}
				counter = counter + 1;
			}
		}
			
		return FinalQuery;
	</cfscript>
	
</cffunction>