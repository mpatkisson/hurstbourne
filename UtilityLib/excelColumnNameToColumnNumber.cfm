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
 Converts an Excel Column Name to its numeric column position.
 
 @param columnNamePassIn 	 Column name (as string) to convert. (Required)
 @return Returns a number. 
 @author Nolan Erck (nolan.erck@gmail.com) 
 @version 1, August 22, 2011 
--->
function excelColumnNameToColumnNumber( columnNamePassedIn ) {
	var columnName = UCase( Trim( arguments.columnNamePassedIn ) ); // clean up our data a bit to make some ASCII math easier...
	var colLength  = Len( Trim( columnName ) );
	var cur_Char   = "";
	var index      = colLength;
	var columnNumber = 0;
	var expBase    = 26;
	var digitPlaceHolder = 0;
	var subTotal   = 0;

	while( index gt 0 )
	{
		cur_Char     = Mid( columnName, index, 1 );
		columnNumber = ( ( Asc( cur_Char ) - 64 ) * ( expBase ^ digitPlaceHolder ) );
		subTotal    += columnNumber;

		index--;		
		digitPlaceHolder++;
	}

	return subTotal;
}