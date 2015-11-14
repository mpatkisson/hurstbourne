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
 Decompresses a binary or (base64|hex|uu) encoded string using the gzip algorithm; returns a string.
 
 @param text 	 Compressed string to decompress. (Required)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="ungzip"
	returntype="any"
	displayname="ungzip"
	hint="decompresses a binary|(base64|hex|uu) using the gzip algorithm; returns string"
	output="no">
	<!---
		Acknowledgements:
		Christian Cantrell, byte array for CF
		 - http://weblogs.macromedia.com/cantrell/archives/2004/01/byte_arrays_and_1.cfm
	--->
	<cfscript>
		var bufferSize=8192;
		var byteArray = createObject("java","java.lang.reflect.Array").newInstance(createObject("java","java.lang.Byte").TYPE,bufferSize);
		var decompressOutputStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var input=0;
		var decompressInputStream=0;
		var l=0;
		if(not isBinary(arguments[1]) and arrayLen(arguments) is 1) return;
		if(arrayLen(arguments) gt 1){
			input=binaryDecode(arguments[1],arguments[2]);
		}else{
			input=arguments[1];
		}
		decompressInputStream=createObject("java","java.util.zip.GZIPInputStream").init(createObject("java","java.io.ByteArrayInputStream").init(input));
		l=decompressInputStream.read(byteArray,0,bufferSize);

		while (l gt -1){
			decompressOutputStream.write(byteArray,0,l);
			l=decompressInputStream.read(byteArray,0,bufferSize);
		}
		decompressInputStream.close();
		decompressOutputStream.close();

		return decompressOutputStream.toString();
	</cfscript>
</cffunction>