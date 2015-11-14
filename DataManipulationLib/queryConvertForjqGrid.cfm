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

<cfscript>
/**
 * Creates a data structure that can be easily used by jqGrid.
 * 
 * @param q 	 The query to be paginated (Required)
 * @param page 	 The page number to be returned (Required)
 * @param pageSize 	 The number of items per page (Required)
 * @return Returns a structure with the following keys {page, records, rows[], total} 
 * @author Scott Stroz (scott@boyzoid.com) 
 * @version 0, March 24, 2011 
 */
function queryConvertForjQGrid( q, page, pageSize ){
	/*
	NOTE: In order for jqGrid to be able to use the result of this function
	you MUST add this to you jqGrid config:
	jsonReader : {
			repeatitems: false, 
			id: "{id}}"
		},
	Where {id} is the unique identifier for each row in the query object.
	*/
	var ret = {};
	var row = {};
	var cols = listToArray( q.columnList );
	var col = "";
	var i = 0;
	var end = arguments.page * arguments.pageSize;
	var start = end - (arguments.pagesize - 1);
	ret[ "total" ] = 0;
	ret[ "page" ] = arguments.page;
	ret[ "records" ] = arguments.q.recordcount;
	if( q.recordCount ){
		ret[ "total" ] = ceiling( arguments.q.recordcount / arguments.pageSize );
	}
	ret["rows"] = [];
	for( i=start; i LTE min(q.recordCount, end); i++ ){
		structClear( row );
		for(col in cols){
			if(isDate( q[ col ][ i ] ) ){
				row[ lcase( col ) ] = dateFormat( q[ col ][ i ], "yyyy-dd-mm" ) & " " & timeFormat( q[ col ][ i ], "HH:mm:ss" );
			}
			else{
				row[ lcase( col )] = q[ col ][ i ];
			}
		}
		arrayAppend( ret[ "rows" ], duplicate( row ) );
	}
	return ret;
}
</cfscript>