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
 * Locate a value in an already-sorted array.
 * 
 * @param array 	 The array to check. (Required)
 * @param value 	 The value to look for. (Required)
 * @return Returns the position of the match, or 0. 
 * @author Kenneth Fricklas (kenf@mallfinder.com) 
 * @version 1, September 30, 2005 
 */
function arrayFindSorted(arrayX, value) 
{
	var m = 0;	
	var found = 0;
	var done = 0;
	var hi = arrayLen(arrayX)+1;
	var lo = 1;
	var i = 1;
	var maxtest = 500;
	do {
		m = (hi + lo) \ 2;
		if (arrayX[m] EQ value)
		{
			found = 1;
			done = 1;
		}
		else
		{
			if ((m EQ lo) or (m EQ hi))
				done = 1; /* not found */
			else
			{	
				if (value LT arrayX[m])
				{
				/* higher */
					hi = m;
				}
				else
				{
				/* lower */
					lo = m;
				}
			}
		}
		if (i EQ maxtest)
			{
			done = 1;
			writeoutput("Error! overflow in search");
			}
		else
			i = i + 1;
	} while (done EQ 0);
	if (found)
		return m;
	else
		return 0;
}
</cfscript>