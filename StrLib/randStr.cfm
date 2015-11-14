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
 * Returns a randomly generated string using the specified character sets and length(s)
 * 
 * @param strLen 	 Either a number of a list of numbers representing the range in size of the returned string. (Required)
 * @param charset 	 A string describing the type of random string. Can contain: alpha, numeric, and upper. (Required)
 * @return Returns a string. 
 * @author Bobby Hartsfield (bobby@acoderslife.com) 
 * @version 2, April 2, 2007 
 */
function randStr(strLen, charSet) {
	var usableChars = "";
	var charSets = arrayNew(1);
	var tmpStr = "";	
	var newStr = "";
	var i = 0;
	var thisCharPos = 0;
	var thisChar = "";
	
	charSets[1] = '48,57';	// 0-9
	charSets[2] = '65,90';	// A-Z
	charSets[3] = '97,122';	// a=z
	
	if (findnocase('alpha', charSet)) { usableChars = listappend(usableChars, 3); }
	
	if (findnocase('numeric', charSet)) { usableChars = listappend(usableChars, 1); }
	
	if (findnocase('upper', charSet)) { usableChars = listappend(usableChars, 2); }
	
	if (len(usableChars) is 0) { usableChars = '1,2,3'; }

	if(listlen(strLen) gt 1 and listfirst(strLen) lt listlast(strLen)) { strLen = randrange(listfirst(strLen), listlast(strLen)); }
	else if (val(strLen) is 0) { strLen = 8; }
	
	
	while (len(tmpStr) LE strLen-1)
	{
		thisSet = listFirst(usableChars);
		usableChars = listdeleteat(usableChars, 1);
		usableChars = listappend(usableChars, thisSet);
	
		tmpStr = tmpStr & chr(randrange(listfirst(charSets[thisSet]), listlast(charSets[thisSet])));
	}
	
	for (i=1; i lte strLen; i=i+1)
	{
		thisCharPos = randrange(1, len(tmpStr));
		thisChar = mid(tmpStr, thisCharPos, 1);
		tmpStr = removeChars(tmPStr, thisCharPos, 1);
		newstr = newstr & thisChar;
	}
	
	return newStr;
}
</cfscript>