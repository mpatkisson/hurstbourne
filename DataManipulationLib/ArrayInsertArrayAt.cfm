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
 * Inserts an array at specified position in another array.
 * 
 * @param a1 	 The first array. 
 * @param a2 	 The second array. 
 * @param pos 	 The position to insert at.  
 * @return Returns an array. 
 * @author Craig Fisher (craig@altainteractive.com) 
 * @version 1, September 13, 2001 
 */
function ArrayInsertArrayAt(a1, a2, pos) {
	var aNew = ArrayNew(1);
	var len1 = "";
	var len2 = "";
	var i = 1;
	if ((NOT isArray(a1)) OR (NOT isArray(a2)) OR (NOT IsNumeric(pos)) OR (pos LT 1) OR (pos GT ArrayLen(a1) +1) )  {
		writeoutput("Error in <Code>ArrayInsertArrayAt()</code>! Correct usage: ArrayInsertArrayAt(<I>Array1</I>, <I>Array2</I>,
<I>position</I>) -- Inserts <I>Array2</I> at <I>position</I> in
<I>Array2</I>");
		return 0;
	}
	pos=int(pos);
	len1=ArrayLen(a1);
	len2=ArrayLen(a2);
	aNew=Duplicate(a1);
	if (pos IS NOT Len1 + 1) {
		for (i=0; i LT len2; i=i+1) ArrayInsertAt(aNew, pos + i, Duplicate(a2[i+1]));
	}
	else {
		for (i=1;i LTE len2;i=i+1) ArrayAppend(aNew, Duplicate(a2[i]));
	}	
	return aNew;
}
</cfscript>