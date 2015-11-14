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
 * Returns the difference between the SOUNDEX values of two strings
 * 
 * @param str1 	 First string. (Required)
 * @param str2 	 Second string. (Required)
 * @return Returns a number. 
 * @author Benjamin Pate / Steve Bianco (benjamin@pate.org) 
 * @version 1, May 26, 2003 
 */
/**
 * Returns the difference between the SOUNDEX values of two
 * strings as an integer from 0-4. 0=No match, 4=Exact match.
 *
 * Note: Requires SOUNDEX UDF from Ben Forta
 *
 * @param str1	First string to be compared
 * @param str2	Second string to be compared
 * @return returns a number from 0 to 4
 * @author Benjamin Pate B525 P300 (benjamin@pate.org)
 * @author Steven Bianco S315 B520 (steventbianco@yahoo.com)
 * @version 1, April 17, 2003
 */

function SoundexDifference(str1, str2)
{
	var temp1 = Soundex(str1);
	var temp2 = Soundex(str2);

	var i = 0;
	var result = 0;
	
	for (i = 1 ; i LTE 4 ; i = i + 1)
	{
		if (MID(temp1, i, 1) IS MID(temp2, i , 1))
		{
			result = result + 1;
		}
	}
	return result;
}
</cfscript>