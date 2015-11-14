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
 * Unzips a file to the specified directory.
 * 
 * @param zipFilePath 	 Path to the zip file (Required)
 * @param outputPath 	 Path where the unzipped file(s) should go (Required)
 * @return void 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, September 1, 2003 
 */
function unzipFile(zipFilePath, outputPath) {
	var zipFile = ""; // ZipFile
	var entries = ""; // Enumeration of ZipEntry
	var entry = ""; // ZipEntry
	var fil = ""; //File
	var inStream = "";
	var filOutStream = "";
	var bufOutStream = "";
	var nm = "";
	var pth = "";
	var lenPth = "";
	var buffer = "";
	var l = 0;
     
	zipFile = createObject("java", "java.util.zip.ZipFile");
	zipFile.init(zipFilePath);
	
	entries = zipFile.entries();
	
	while(entries.hasMoreElements()) {
		entry = entries.nextElement();
		if(NOT entry.isDirectory()) {
			nm = entry.getName(); 
			
			lenPth = len(nm) - len(getFileFromPath(nm));
			
			if (lenPth) {
			pth = outputPath & left(nm, lenPth);
		} else {
			pth = outputPath;
		}
		if (NOT directoryExists(pth)) {
			fil = createObject("java", "java.io.File");
			fil.init(pth);
			fil.mkdirs();
		}
		filOutStream = createObject(
			"java", 
			"java.io.FileOutputStream");
		
		filOutStream.init(outputPath & nm);
		
		bufOutStream = createObject(
			"java", 
			"java.io.BufferedOutputStream");
		
		bufOutStream.init(filOutStream);
		
		inStream = zipFile.getInputStream(entry);
		buffer = repeatString(" ",1024).getBytes(); 
		
		l = inStream.read(buffer);
		while(l GTE 0) {
			bufOutStream.write(buffer, 0, l);
			l = inStream.read(buffer);
		}
		inStream.close();
		bufOutStream.close();
		}
	}
	zipFile.close();
}
</cfscript>