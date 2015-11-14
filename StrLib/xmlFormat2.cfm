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
 * Similar to xmlFormat() but replaces all characters not on the &quot;good&quot; list as opposed to characters specifically on the &quot;bad&quot; list.
 * 
 * @param inString 	 String to format. (Required)
 * @return Returns a string. 
 * @author Samuel Neff (sam@serndesign.com) 
 * @version 1, January 12, 2004 
 */
function xmlFormat2(inString) {
   
   var goodChars = "!@##$%^*()0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~[]{};:,./?\| -_=+#chr(13)##chr(10)##chr(9)#";
   var i = 1;
   var c = "";     
   var s = "";
   
   for (i=1; i LTE len(inString); i=i+1) {
      
      c = mid(inString, i, 1);
      
      if (find(c, goodChars)) {
         s = s & c;
      } else {
         s = s & "&##" & asc(c) & ";";
      }
   }
   
   return s;
}
</cfscript>