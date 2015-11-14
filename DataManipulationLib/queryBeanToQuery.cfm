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
 * Converts a Java QueryBean object to a ColdFusion query object.
 * 
 * @param objQueryBean 	 A Java QueryBean object. (Required)
 * @return Returns a query. 
 * @author Alistair Davidson (alistair_davidson@hotmail.com) 
 * @version 1, May 20, 2005 
 */
function queryBeanToQuery(objQueryBean) {
	var qry_return = "";
	var arrColumns = ArrayNew(1);
	var arrRows = arrayNew(1);
	var thisRow = 0;
	var thisCol = 0;
	var numRows = 0;
	var thisVal = "";
	
	if( objQueryBean.getClass() EQ "class coldfusion.xml.rpc.QueryBean" ){
		arrColumns = objQueryBean.getColumnList();
		numCols = arrayLen( arrColumns );
		arrRows = objQueryBean.getData();
		numRows = arrayLen( arrRows );
		// create the return query object
		qry_return = QueryNew( ArrayToList(arrColumns) );
		// loop round each row
		for( thisRow = 1; thisRow LTE numRows; thisRow = thisRow + 1 ){
			QueryAddRow( qry_return );
			// loop round each column
			for( thisCol = 1; thisCol LTE numCols; thisCol = thisCol + 1 ){
				// empty columns seem to give rise to undefined array elements!
				try{
					thisVal = arrRows[thisRow][thisCol];
				} 
				catch(Any e) {
					thisVal = "";
				}
				QuerySetCell( qry_return, arrColumns[thisCol], thisVal );
			}
		}
		return qry_return;
		
	} else return queryNew("");
}
</cfscript>