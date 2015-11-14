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
 * Will recast a query column to a different datatype.
 * 
 * @param qry 	 Query to modify. (Required)
 * @param column 	 Column to modify. (Required)
 * @param datatype 	 Data type to convert to. (Required)
 * @return Returns a query. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, June 14, 2011 
 */
function castQueryColumn(qry, column, datatype) {
	var columnData = arrayNew(1);
	var ii = "";
	var loop_len = arguments.qry.recordcount;
	var columnNames = arraytoList(arguments.qry.getMetaData().getColumnLabels());
	var qoq = new Query();
	var newQry = new Query();
	var javatype = '';
	
	datatype = lcase(datatype);

	if (Listfindnocase(columnNames, arguments.column) IS 0) {return arguments.qry;}

	switch(datatype){
		case "integer": {javatype = "int"; break;}
		case "bigint": {javatype = "long"; break;}
		case "decimal": {javatype = "BigDecimal"; break;}
		case "varchar": {javatype = "string"; break;}
		case "binary": {javatype = "byte"; break;}
		case "bit": {javatype = "boolean"; break;}
		default: {javatype = "string"; break;}
	}

	for (ii=1; ii lte loop_len; ii=ii+1) {
		if (isNull(arguments.qry[arguments.column][ii])) {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);
		} else if (listfindnocase("date,time", datatype) AND ISDate(arguments.qry[arguments.column][ii])) {	
			arrayAppend(columnData, parsedatetime(arguments.qry[arguments.column][ii]));	
		} else if (listfind("int,long,float,BigDecimal,string,byte,boolean", javatype)){
			arrayAppend(columnData, JavaCast(javatype, arguments.qry[arguments.column][ii]));	
		} else {
			arrayAppend(columnData, arguments.qry[arguments.column][ii]);	
		}
	}

  columnNames = ListDeleteAt(columnNames, Listfindnocase(columnNames, column));
  qoq.setAttributes(QoQsrcTable = arguments.qry);
  newQry = qoq.execute(sql="select #columnNames# from QoQsrcTable", dbtype="query");
  newQry = newQry.getResult();

  QueryAddColumn(newQry, column, datatype, columnData);

  return newQry;

}
</cfscript>