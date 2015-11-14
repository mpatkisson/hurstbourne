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
 * This UDF will take a Tab delimited text file and parse it into a mutlidimensional array
 * 
 * @param x 	 Tab text to parse. (Required)
 * @return Retuns an array. 
 * @author Ray Bayly (rbayly@mediageneral.com) 
 * @version 1, May 9, 2003 
 */
function GetTabTextFeed(X){
	//Declare all variables used within this UDF
	var Xy = "";//This is an array that holds the lines
	var Xc = "";//this is the count for the number of lines 
 	var Yl = "";//This is a temp holder for the line
	var Yc = "";//This holds the length of the line bieng called
	var Yt = "";//this is an array that holds the line
	var i = 1;
	
	Xy = ArrayNew(1);
	Xc = ListLen(X, chr(10));
	for(i=1;i LTE Xc;i=i+1){
		Yl = ListGetAt(X, i, chr(10));
		//Now I check for missing data 
		Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
	    //I know redundant code but for some reason it does not 
		//catch all the tabs the first time through
	 	Yl = replaceNoCase(Yl, "		", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "	 	", "	NA	", "ALL");
		Yl = replaceNoCase(Yl, "			", "	NA	NA	", "ALL");
		//Now we grab the size of the Line/List
		Yc = ListLen(Yl, chr(9));
		//Set Yt as the array for the line
		Yt = ArrayNew(1);
		for(ix=1;ix LTE Yc;ix=ix+1){
			//load each piece of text into an Array Dimension
			Yt[ix] = ListGetAt(Yl, ix, chr(9));
		}
		//Add the New "Array Line" to the Master Array
		Xy[i] = Yt;
	}
	return Xy;
}
</cfscript>