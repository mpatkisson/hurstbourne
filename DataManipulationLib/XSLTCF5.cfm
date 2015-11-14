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
 * Processes an XSL Template against an XML document and returns the transformed content.
 * 
 * @param Source 	 XML Source (Required)
 * @param Style 	 XML Stylesheet (Required)
 * @return Returns the XML data with formatting. 
 * @author Joshua Miller (josh@joshuasmiller.com) 
 * @version 1, September 20, 2004 
 */
function xsltcf5(source,style){
	// Instantiate COM Objects
	var objSource=CreateObject("COM", "Microsoft.XMLDOM", "INPROC");
	var objStyle=CreateObject("COM", "Microsoft.XMLDOM", "INPROC");
	var sourceReturn = "";
	var styleReturn = "";
	var styleRoot = "";
	var xsloutput = "";
	// Parse XML
	objSource.async = "false";
	sourceReturn = objSource.load("#source#");
	// Parse XSL
	objStyle.async = "false";
	styleReturn = objStyle.load("#style#");
	// Transform Document 
	styleRoot = objStyle.documentElement;
	xsloutput = objSource.transformNode(styleRoot);
	// Output Results
	return xsloutput;
}
</cfscript>