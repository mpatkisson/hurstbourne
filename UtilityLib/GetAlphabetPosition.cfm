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
 * Returns the numeric value of a letter's position in the alphabet, or the returns matching letter of a number in the alphabet.
 * 
 * @param charornum 	 Either a character or number. 
 * @return Returns either a character, number, or empty string on error. 
 * @author Seth Duffey (sduffey@ci.davis.ca.us) 
 * @version 1, January 7, 2002 
 */
function GetAlphabetPosition(charornum) {
  var a_numeric = asc("a");
  charornum = lCase(trim(charornum));

  if(isNumeric(charornum)) {
      if(charornum lte 0 OR charornum gte 27) return "";
      return chr(charornum+a_numeric-1);
  } else {
      if(len(charornum) gt 1) return "";
      if(REFind("[^a-z]",charornum)) return "";
      return asc(charornum) - a_numeric + 1;
  }
  return 1;
}
</cfscript>