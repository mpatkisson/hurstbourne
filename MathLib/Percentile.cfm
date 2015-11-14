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
 * Function for calculating the percentile of a given number from a population of numbers.
 * 
 * @param number 	 The number you want to get the percentile rank of 
 * @param aPopulation 	 An array of numbers which is the population to find the percentile in 
 * @param insertNumber 	 Boolean value to decide if the number should be inserted into the population before calculation.  By default this is false. 
 * @return Returns a numeric percent value 
 * @author Nathan Dintenfass (nathan@changemedia.com) 
 * @version 1, July 30, 2001 
 */
function percentile(numberToCheck,populationArray){
	// (Thanks to Jim Flannery for pointing me at the formula).
	var ii = 1;
	//set a counter for the number below this value
	var countBelow = 0;
	//set a counter for how many instances of thisNumber there are
	var countWithin = 0;
	// deal with the optional parameter as to whether the number to check is to be added to the population.
	//if there a third argument and it is a boolean and it is true, insert the number to check 
	if(arraylen(arguments) gt 2 AND isBoolean(arguments[3]) and arguments[3])
		arrayAppend(populationArray,numberToCheck);
	//now, let's sort the array to make it easier to find the values
	arraySort(populationArray,"numeric");
	//loop through the array, setting the counters appropriately
	for(ii = 1; ii lte arraylen(populationArray); ii = ii + 1){
		//if this number is below numberToCheck, increment the countBelow
		if(populationArray[ii] lt numberToCheck){
			countBelow = countBelow + 1;
		}
		else{
			//if this number is equal to numberToCheck, increment the counterWithin
			if(populationArray[ii] eq numberToCheck){
				countWithin = countWithin + 1;
			}
			//if this number is above the numberToCheck break
			else{
				break;
			}
		}
	}
	//run the percentile formula and return
	return ((countBelow + 0.5 * countWithin)/arraylen(populationArray))*100;
}
</cfscript>