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
 * Reformats special chars typically found when copying and pasting from Word.
 * v2 by James Moberg
 * 
 * @param str 	 The string to modify. (Required)
 * @return Returns a string. 
 * @author Glen Salisbury (gsalisbury@collegepublisher.com) 
 * @version 2, January 3, 2011 
 */
function ConvertSpecialChars(textin) {
       var bad = "#chr(145)#,#chr(146)#,#chr(147)#,#chr(148)#,#chr(151)#,#CHR(8217)#,#CHR(8216)#,#chr(188)#,#chr(189)#,#chr(190)#,#chr(174)#,#chr(173)#,#chr(169)#,#chr(160)#,#chr(153)#,#chr(150)#,#chr(149)#,#chr(133)#,#CHR(8220)#,#CHR(8221)#";
       var good = "',',"","",-,',',1/4,1/2,3/4,(R),-,(C), ,TM,--,*,...,"",""";
       return ReplaceList(textin, bad, good);
}
</cfscript>