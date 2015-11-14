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
 * Convert Microsoft SQL Server Data Type to equivilent CFSQLType
 * Most useful when querying MS SQL Server sys tables to return data type from the table structure and converting to a CF data type for use within the &lt;cfqueryparam&gt; tag.
 * 
 * Example Usage
 * #MSSQL2CFSQLDT('nvarchar')#  returns  CF_SQL_VARCHAR
 * 
 * Author C. Jason Wilson (cjwilson@cf-developer.net) 
 * version 1, January 13, 2009
 * 
 * @param dataType 	 String of datatype to use (Required)
 * @return returns a string 
 * @author C. Jason Wilson (cjwilson@cf-developer.net) 
 * @version 0, May 9, 2009 
 */
function MSSQL2CFSQLDT (DataType) {
	var MSSQLType = 'int,bigint,smallint,tinyint,numeric,money,smallmoney,bit,decimal,float,real,datetime,smalldatetime,char,nchar,varchar,nvarchar,text,ntext';
	var CFSQLType = 'CF_SQL_INTEGER,CF_SQL_BIGINT,CF_SQL_SMALLINT,CF_SQL_TINYINT,CF_SQL_NUMERIC,CF_SQL_MONEY4,CF_SQL_MONEY,CF_SQL_BIT,CF_SQL_DECIMAL,CF_SQL_FLOAT,CF_SQL_REAL,CF_SQL_TIMESTAMP,CF_SQL_DATE,CF_SQL_CHAR,CF_SQL_CHAR,CF_SQL_VARCHAR,CF_SQL_VARCHAR,CF_SQL_LONGVARCHAR,CF_SQL_LONGVARCHAR';
	
	if(ListFind(MSSQLType,DataType)) {
		return ListGetAt(CFSQLType,ListFind(MSSQLType,DataType));
	} else { return 'NULL'; }
}
</cfscript>