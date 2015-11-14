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
 * Accepts a numeric GUID stored in a Byte Array and converts it to a string in the normal convention.
 * 
 * @param guidByteArray 	 GUID Byte array returned from a query. (Required)
 * @return Returns a string. 
 * @author Samuel Neff (sam@blinex.com) 
 * @version 1, September 6, 2002 
 */
function guidToString(guidByteArray) {
   var hexString='';
   
   if (IsArray(guidByteArray) AND ArrayLen(guidByteArray) GTE 16) {
     hexString=hexString & guidByteToHex(guidByteArray[4]);
     hexString=hexString & guidByteToHex(guidByteArray[3]);
     hexString=hexString & guidByteToHex(guidByteArray[2]);
     hexString=hexString & guidByteToHex(guidByteArray[1]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[6]);
     hexString=hexString & guidByteToHex(guidByteArray[5]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[8]);
     hexString=hexString & guidByteToHex(guidByteArray[7]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[9]);
     hexString=hexString & guidByteToHex(guidByteArray[10]);
     hexString=hexString & "-";
     hexString=hexString & guidByteToHex(guidByteArray[11]);
     hexString=hexString & guidByteToHex(guidByteArray[12]);
     hexString=hexString & guidByteToHex(guidByteArray[13]);
     hexString=hexString & guidByteToHex(guidByteArray[14]);
     hexString=hexString & guidByteToHex(guidByteArray[15]);
     hexString=hexString & guidByteToHex(guidByteArray[16]);
   }
   
   return hexString;
}

function guidByteToHex(guidByte) {
   // Accepts a single byte and converts it to a two digit Hex number.
   
   var hexByte=Ucase(Right(FormatBaseN(guidByte, 16),2));
   if (Len(hexByte) IS 0) {
      hexByte='00';
   } else if (Len(hexByte) IS 1) {
      hexByte='0' & hexByte;
   }
   
   return hexByte;
}
</cfscript>