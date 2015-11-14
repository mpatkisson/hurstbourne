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
 * swfHeader reads a swf file's header and returns it's meta information, including height, width and Flash version.
 * 
 * @param filePath 	 Path to SWF file. (Required)
 * @return Returns a struct. 
 * @author Alan Rother (alan.rother@gmail.com) 
 * @version 0, August 21, 2009 
 */
function getSWFHeaderInfo(filePath) {
	//setup the vars
	var headerValues 	= 	StructNew();
	var fis				=	'';
	var decoder			=	'';
	var header			=	'';
	var rect			=	'';
	
	//create defaults for the return struct
	headerValues.IsCompressed			=	'';
	headerValues.FrameCount				=	0;
	headerValues.FrameRate				=	0;
	headerValues.FlashVersion			=	0;
	headerValues.Height					=	0;//returned in px
	headerValues.Width					=	0;//returned in px
	headerValues.Errors					=	'';
	
	if(ListLast(filePath, ".") IS "swf")
		{
			try
				{
					//Create a file input stream to load the SWF file into Java
					fis = createObject("java", "java.io.FileInputStream").init(filePath);
					//create a decoder object to read the file
					decoder = createObject("java", "macromedia.swf.TagDecoder").init(fis);
					// Decode the header
					header = decoder.decodeHeader(); 
					//close the input stream
					fis.close();
					//pull out the dimensions of the swf for later parsing
					rect = header.size;	
					//load the values returned from Java into the return struct
					headerValues.IsCompressed			=	header.compressed;
					headerValues.FrameCount				=	header.framecount;
					headerValues.FrameRate				=	header.rate;
					headerValues.FlashVersion			=	header.version;
					headerValues.Height					=	(rect.getHeight()/20);//divided by 20 to return the value in px (the orig value is in twips)
					headerValues.Width					=	(rect.getWidth()/20);//divided by 20 to return the value in px (the orig value is in twips)
				}
			catch(Any excpt)
				{
					headerValues.Errors					=	excpt.RootCause.Cause.Message;
				}
		}


	//return the struct
	return headerValues;
}
</cfscript>