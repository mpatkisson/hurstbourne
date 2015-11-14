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
 * Returns the proper dimensions of an image resized to a certain maximum size.
 * 
 * @param originalWidth 	 Width of image. (Required)
 * @param originalHeight 	 Height of image. (Required)
 * @param target 	 New target size. (Required)
 * @return Returns a structure. 
 * @author Christopher Jordan (cjordan@placs.net) 
 * @version 1, February 22, 2006 
 */
function imageResizeAspectRatio(originalWidth,originalHeight,target){
	var width		= 0;
	var height		= 0;
	var percentage	= 0;
	var imageProperties	= structnew();

	percentage = (target / originalHeight);
	if (originalWidth gt originalHeight) { 
		percentage = (target / originalWidth);
	}
	
	newWidth				= round(originalWidth * percentage);
	newHeight				= round(originalHeight * percentage);
	imageProperties.width	= newWidth;
	imageProperties.height	= newHeight;
	
	return imageProperties;		
}
</cfscript>