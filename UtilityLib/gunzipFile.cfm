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
 * Unzip a gzipped (.gz) file.
 * 
 * @param infilePath 	 Full path to gz file. (Required)
 * @param outputPath 	 Where to extract the gzfile. Defaults to current directory. (Optional)
 * @return Returns a boolean. 
 * @author Vaughan Allan (vallan@abnamromorgans.com.au) 
 * @version 1, May 3, 2010 
 */
function gunzipFile(infilePath) {
	var zipfile = "";
	var outfile = "";
	var outputPath = "";
	var infile = "";
	var gzInStream = createObject('java','java.util.zip.GZIPInputStream');
	var outStream = createObject('java','java.io.FileOutputStream');
	var inStream = createObject('java','java.io.FileInputStream');
	var buffer = repeatString(" ",1024).getBytes();
	var length = 0;
	var rv = true;
   
	if (arrayLen(Arguments) gte 2) outputPath = arguments[2];
	else outputPath = getDirectoryFromPath(infilePath);

	if (right(infilePath,3) neq '.gz') infilePath = infilePath & '.gz';

	if(right(outputPath,1) neq "/" and right(outputPath,1) neq "\") outputPath = outputPath & "/";
   
	try {
		infile = getFileFromPath(infilePath);
		outfile = outputPath & left(infile,len(infile) - 3);
		inStream.init(infilePath);
		gzInStream.init(inStream);
		outStream.init(outfile);
		do {
			length = gzInStream.read(buffer,0,1024);
            if (length neq -1) outStream.write(buffer,0,length);
		} while (length neq -1);
		outStream.close();
		gzInStream.close();
	} 
	catch (any e) {
		rv = false;
		try {
			outStream.close();
		} catch (any e) { }
			try {
				gzInStream.close();
			} catch (any e) { }
	}
	return rv;
}
</cfscript>