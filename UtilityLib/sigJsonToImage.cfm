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
 * A supplemental script for Signature Pad that generates an image of the signature's JSON output server-side.
 * 
 * @param jsonData 	 String (JSON) output from Signature Pad (Required)
 * @return Returns an image object. 
 * @author James Moberg (james@ssmedia.com) 
 * @version 1, October 7, 2011 
 */
function sigJsonToImage(jsonData){
	var options = structNew();
	var lineOptions = structNew();
	options["imagesize"] = listtoarray("198, 55");
	options["bgColour"] = '##ffffff';
	options["penWidth"] = 2;
	options["penColour"]  = '##145394';
	options["drawMultiplier"] = 12;
	if(ArrayLen(arguments) GTE 2 AND isStruct(arguments[2])) {
		structAppend(options, arguments[2], true);
	}
	if(NOT isarray(jsonData) AND isjson(jsonData)){
		jsonData = DeserializeJSON(jsonData);
	}
	if (NOT IsArray(jsonData)){
		return "";
	} else if (NOT isStruct(jsonData[1])){
		return "";
	} else if (NOT structKeyExists(jsonData[1], "lx")){
		return "";
	}
	img = ImageNew("", options["imagesize"][1] * val(options["drawMultiplier"]), options["imagesize"][2] * val(options["drawMultiplier"]), "ARGB");
	ImageSetBackgroundColor(img, options["bgColour"]);
	imageSetAntialiasing(img, "on");
	ImageSetDrawingColor(img, options["penColour"]);
		
	lineOptions["width"] = options["penWidth"] * (options["drawMultiplier"] / 2);
	lineOptions["endcaps"] = "round";
	lineOptions["lineJoins"] = "round";  /* use join for CF9 */
	ImageSetDrawingStroke(img, lineOptions);

	for (v=1;v LTE ArrayLen(jsonData);v=v+1) {
		ImageDrawLine(img, jsonData[v].lx * val(options["drawMultiplier"]), jsonData[v].ly * val(options["drawMultiplier"]), jsonData[v].mx * val(options["drawMultiplier"]), jsonData[v].my * val(options["drawMultiplier"]));
	}

	ImageResize(img, options["imagesize"][1], options["imagesize"][2], "highPerformance");

	return img;
}
</cfscript>