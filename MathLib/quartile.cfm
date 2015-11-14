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
 * Returns the first, second, or third quartile value for a set of numeric values.
 * 
 * @param values 	 Values to parse. (Required)
 * @param quartile 	 Numeric value between 1 and 3. (Required)
 * @return Returns a number. 
 * @author Nathan Mische (nmische@gmail.com) 
 * @version 0, June 11, 2009 
 */
function quartile(values, q) {
	var valueArray = 0;
	var numValues = 0;
	var leftIndex = 0;
	var rightIndex = 0;
	var middleIndex = 0;
	var median = 0;
	var i = 0;
	var halfValues = ArrayNew(1);
	var val = 0;

	if (IsArray(values)){
		valueArray = Duplicate(values);
	} else {
		valueArray = ListToArray(values);
	}

	ArraySort(valueArray,"numeric");
	numValues = ArrayLen(valueArray);

	// get the median
	if((numValues mod 2) eq 0) {
		leftIndex = Int(numValues/2);
		rightIndex = Int(numValues/2) + 1;
		median = (valueArray[leftIndex] + valueArray[rightIndex]) / 2;
	} else {
		middleIndex = Int(numValues/2) + 1;
		median = valueArray[middleIndex];
	}

	// return the quartile
	if (q eq 1) {
		for (i = 1; i lte numValues; i = i + 1){
			val = valueArray[i];
			if ( val lt median) {
				ArrayAppend(halfValues,val);
			} else {
				break;
			}
		}
		return Quartile(halfValues,2);
	} else if (q eq 2) {
		return median;
	} else if (q eq 3) {
		for (i = numValues; i gt 0; i = i - 1){
			val = valueArray[i];
			if ( val gt median) {
				ArrayAppend(halfValues,val);
			} else {
				break;
			}
		}
		return Quartile(halfValues,2);
	}

	// return a blank string if invalid quartile
	return "";

}
</cfscript>