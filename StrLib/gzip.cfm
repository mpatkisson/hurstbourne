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
 Compresses a string using the gzip algorithm; returns binary or a string of (base64|hex|uu).
 
 @param text 	 String to compress. (Required)
 @param format 	 binary,base64,hex, or uu. Defaults to binary. (Optional)
 @return Returns a string. 
 @author Oblio Leitch (oleitch@locustcreek.com) 
 @version 1, November 14, 2007 
--->
<cffunction name="gzip"
	returntype="any"
	displayname="gzip"
	hint="compresses a string using the gzip algorithm; returns binary or string(base64|hex|uu)"
	output="no">
	<!---
		Acknowledgements:
		Andrew Scott, original gzip compression routine
		 - http://www.andyscott.id.au/index.cfm/2006/9/12/Proof-of-Concept
	--->
	<cfscript>
		var result="";
		var text=createObject("java","java.lang.String").init(arguments[1]);
		var dataStream=createObject("java","java.io.ByteArrayOutputStream").init();
		var compressDataStream=createObject("java","java.util.zip.GZIPOutputStream").init(dataStream);
		compressDataStream.write(text.getBytes());
		compressDataStream.finish();
		compressDataStream.close();

		if(arrayLen(arguments) gt 1){
			result=binaryEncode(dataStream.toByteArray(),arguments[2]);
		}else{
			result=dataStream.toByteArray();
		}
		return result;
	</cfscript>
</cffunction>