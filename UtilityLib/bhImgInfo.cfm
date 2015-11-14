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
 * Image function to return Height, Width and file size.
 * 
 * @param imgfile 	 Absolute path to image file. (Required)
 * @return Returns a struct. 
 * @author Bobby Hartsfield (bobby@acoderslife.com) 
 * @version 1, September 16, 2007 
 */
function bhimginfo(imgfile) {
	var jFileIn = createObject("java","java.io.File").init(imgfile);
	var ImageObject = createObject("java","javax.imageio.ImageIO").read(jFileIn);
	var ImageInfo = StructNew();
	
	var imageFile = CreateObject("java", "java.io.File").init(imgfile); 
	var sizeb = imageFile.length();
	var sizekb = numberformat(sizeb / 1024, "999999999.99");
	var sizemb = numberformat(sizekb / 1024, "99999999.99");
	var bhImageInfo = StructNew();

	bhImageInfo.ImgWidth = ImageObject.getWidth();
	bhImageInfo.ImgHeight = ImageObject.getHeight();
	bhImageInfo.SizeB = sizeb;
	bhImageInfo.SizeKB = sizekb;
	bhImageInfo.SizeMB = sizemb;
	
	return bhImageInfo;
}
</cfscript>