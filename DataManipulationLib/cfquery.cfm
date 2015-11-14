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
 * Mocks the CFQUERY tag.
 * 
 * @param dsn 	 Datasource. Must be registered in the ODBC Control Panel. (Required)
 * @param col 	 List of columns. (Required)
 * @param sql 	 Sql to use. (Required)
 * @return Returns a query. 
 * @author Joe Nicora (joe@seemecreate.com) 
 * @version 1, September 21, 2004 
 */
function cfquery(dsn,col,sql) {
    var datasource = dsn;    
    var userName = "";
    var password = "";
    var adOpenStatic = 3;
    var adLockReadOnly=1;
    var adCmdTxt = 1;
    var adGetRowsRest = -1;
    var columns = listToArray(col); 
    var strSQL = sql;
    var objDataConn = CreateObject("COM", "ADODB.Connection");
    var objDataRst = "";
    var intRecordCount = "";
    var arrRst = "";
    var qry = queryNew(arrayToList(columns));
    var thisCol = "";
    var thisRow = "";

    objDataConn.Open(Datasource, userName, password, -1);
    objDataRst = CreateObject("COM", "ADODB.Recordset");
    objDataRst.open(strSQL, objDataConn, adOpenStatic, adLockReadOnly, adCmdTxt);  
    intRecordCount = objDataRst.RecordCount;
    arrRst = objDataRst.GetRows(adGetRowsRest);
	
    queryAddRow(qry,intRecordCount);
    for (thisCol=1; thisCol LTE arrayLen(columns); thisCol=thisCol+1) {
        for (thisRow=1; thisRow LTE arrayLen(arrRst[thisCol]); thisRow=thisRow+1) {
	    querySetCell(qry,columns[thisCol],arrRst[thisCol][thisRow],thisRow);
	}
    }
    objDataRST.close();
    objDataConn.close();
    return qry;
}
</cfscript>